class Pattern < ActiveRecord::Base
  belongs_to :user
  belongs_to :dataset

  validates :user, presence: true
  validates :dataset, presence: true
end
