class Dataset < ActiveRecord::Base
  has_many :patterns
  belongs_to :user

  validates :user, presence: true
  validates :data, presence: true

  validate :numericality_of_data

  def numericality_of_data
    self.data.each do |value|
      errors.add(:data, "Data must be numeric") if !value =~ /\A[+-]?\d+\Z/
      break
    end
  end
end
