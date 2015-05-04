class Dataset < ActiveRecord::Base
  has_many :patterns, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :data, presence: true

  def data_to_a
    self.data.split(",").map do |point|
      point.gsub!(/[^0-9a-z]/i, '')
      point.to_f
    end
  end

  def self.standard
    User.root.datasets
  end
end
