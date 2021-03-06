class PostsController < ApplicationController
# @author Wawan Kurniawan <ones07@gmail.com>
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'

  before_filter :find_post, :only => [:edit, :update, :destroy, :review, :publish, :renew, :like, :report]
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy, :review, :publish, :renew]
  before_filter :big_adv, :medium_advs, :small_advs, :only => [:new, :review, :edit]

  # new post
  def new
    @post = Post.new
    build_post_images
    respond_to do |format|
      format.html
      format.js
    end
  end

  # save post
  def create
    @post = current_user.posts.new(params[:post])

    if @post.save
      flash.now[:notice] = "Upload success"
      redirect_to review_posts_path(@post.slug)
    else
      build_post_images
      flash.now[:alert] = "Please fill required fields <br />"
      flash.now[:alert] += @post.errors.full_messages.join('<br />')
      render :action => :new
    end
  end

  # review post before publish it
  def review
    @temp = 'description'
    render '/home/show.html'
  end

  # publish post
  def publish
    if @post.update_attributes(:status => 1, :renew => Time.now, :created_at => Time.now)
      flash[:notice] = "Upload saved"
      redirect_to root_path
    else
      flash[:notice] = "Save failed"
      redirect_to review_posts_path(@post.slug)
    end
  end

  # renew pots
  def renew
    if @post.update_attribute(:renew, Time.now)
      flash[:notice] = "Post is renewed"
    else
      flash[:notice] = "Renew failed"
    end

    redirect_to request.env["HTTP_REFERER"] ? :back : detail_path(@post.slug)
  end

  # like pots
  def like
    if @post.likes.create(:user_id => current_user.try(:id), :ip_address => request.ip)
      flash[:notice] = "You like this post"
    else
      flash[:notice] = "Like failed"
    end

    redirect_to request.env["HTTP_REFERER"] ? :back : detail_path(@post.slug)
  end

  # report pots
  def report
    if @post.post_reports.create(:user_id => current_user.try(:id), :ip_address => request.ip)
      flash[:notice] = "Your report has been sent to opportux admin."
    else
      flash[:notice] = "Report post failed failed"
    end

    redirect_to request.env["HTTP_REFERER"] ? :back : detail_path(@post.slug)
  end

  # edit post
  def edit
    render '/posts/new.html'
  end

  # update post
  def update
    if @post.update_attributes(params[:post])
      flash.now[:notice] = "Saved"
      redirect_to review_posts_path(@post.slug)
    else
      flash.now[:notice] = "Save failed"
      redirect_to root_path(@post.slug)
    end
  end

  # remove post
  def destroy
    flash.now[:notice] = @post.destroy ? 'Removed' : 'Failed to remove'
    redirect_to root_path
  end

protected

  # find post
  def find_post
    @post = Post.find_by_slug(params[:slug] || params[:id]) || Post.find_by_id(params[:id])
  end

  # build post images
  def build_post_images
    pis = @post.post_images.count
    pis = pis == 0 ? 3 : pis
    (1..pis).each do
      @post.post_images.build
    end
  end
end
