class Dataset < ActiveRecord::Base
  has_many :patterns, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :data, presence: true

  validate :numericality_of_data
  validate :dataset_length

  def numericality_of_data
    self.data.each do |value|
      if !value.is_a? Numeric
        errors.add(:data, "Data must be numeric")
        break
      end
    end
  end

  def dataset_length
    if data.length < 5
      errors.add(:data, "Dataset must include at least 5 values")
    end
  end
end
