module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper
  include TweetButton

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(image_tag('facebox/closelabel.png'), "remove_fields(this)", :class => 'remove-image')
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end

    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => 'add-image')
  end

  def facebook_like
    content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=standard&show_faces=true&width=450&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
  end

  # @author Wawan Kurniawan <ones07@gmail.com>
  # Indonesian Curreny Format
  def to_rupiach(number, rp = false)
    formated_number = rp ? "Rp " : ""
    formated_number += "#{number_to_currency(number, :separator => ',', :delimiter => '.', :unit => '')}"
  end

  # @author Wawan Kurniawan <ones07@gmail.com>
  # DateTime format
  def date_time_format(date_time)
    date_time.strftime("%Y-%m-%d %H:%M:%S") if date_time
  end

  # @author Wawan Kurniawan <ones07@gmail.com>
  # Date format
  def date_format(date, str = false)
    format = str ? "%d %b %Y" : "%d/%m/%Y"
    date.strftime(format) if date
  end
end
