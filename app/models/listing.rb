class Listing < ActiveRecord::Base
  belongs_to :user, :touch => true
  mount_uploader :image, ImageUploader

  validates :user, :presence => true
end
