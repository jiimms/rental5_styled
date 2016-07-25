class Product < ActiveRecord::Base
	has_many :items
	mount_uploader :image, ImageUploader
	accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
	validates :category, presence: true

	def self.search(search)
  	where("category LIKE ?", "%#{search}%") 
	end
end
