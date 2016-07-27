class Item < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, ImageUploader

  def self.search(search)
  	where("item_for_rent LIKE ? OR brand LIKE ?", "%#{search}%", "%#{search}%") 
	end
end
