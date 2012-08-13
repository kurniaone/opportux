class Advertise < ActiveRecord::Base
  attr_accessible :business_name, :contact_name, :contact_email, :size, :title, :url, :description, :image, :price, :viewed
  mount_uploader :image, AdvUploader

  validates :business_name, :contact_name, :contact_email, :size, :title, :url, :description, :image, :price, :presence => true


  # big
  def self.big
    adv = where(["size = ?", 'big']).offset(rand(size_count('big'))).try(:first)
    if adv
      adv.update_attribute(:viewed, adv.viewed + 1)
      adv
    end
  end

  # medium
  def self.medium
    off = rand(size_count('medium'))
    advs = where(["size = ?", 'medium']).offset(off == 0 ? off : off-1).slice(0, 2)
    advs.each do |adv|
      adv.update_attribute(:viewed, adv.viewed + 1)
    end unless advs.blank?

    advs
  end

  # small
  def self.small
    sc = size_count('small')
    r = rand(sc)
    off = sc != 0 && sc - r < 4 ? sc - 4 : r

    advs = where(["size = ?", 'small']).offset(off).slice(0, 4)
    advs.each do |adv|
      adv.update_attribute(:viewed, adv.viewed + 1)
    end unless advs.blank?

    advs
  end

  def self.size_count(s)
    where(["size = ?", s]).count
  end


end