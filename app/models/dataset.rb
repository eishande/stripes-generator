class Dataset < ActiveRecord::Base
  has_many :patterns
  belongs_to :user

  validates :user, presence: true
  validates :data, presence: true 
end
