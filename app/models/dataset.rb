class Dataset < ActiveRecord::Base
  has_many :patterns
  belongs_to :user

  validates :user, presence: true
  validates :data, presence: true

  validate :numericality_of_data

  def numericality_of_data
    self.data.each do |value|
      if !value.is_a? Numeric
        errors.add(:data, "Data must be numeric")
        break
      end
    end
  end
end
