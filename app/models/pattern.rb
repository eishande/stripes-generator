class Pattern < ActiveRecord::Base
  belongs_to :user
  belongs_to :dataset
end
