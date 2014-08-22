class Request < ActiveRecord::Base
  belongs_to :user, :touch => true
  validates :user, :presence => true
  validates :item, :presence => true
end
