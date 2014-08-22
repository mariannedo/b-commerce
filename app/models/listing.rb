class Listing < ActiveRecord::Base
  belongs_to :user, :touch => true
  mount_uploader :image, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  validates :user, :presence => true
end
