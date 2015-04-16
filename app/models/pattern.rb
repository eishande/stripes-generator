class Pattern < ActiveRecord::Base
  belongs_to :user
  belongs_to :dataset

  validates :user, presence: true
  validates :dataset, presence: true
  validates :colors, presence: true

  validate :colors_format
  validate :colors_hex_format

  def colors_length
    if colors.length != 5
      errors.add(:colors, "Exactly 5 colors are allowed")
    end
  end

  def colors_hex_format
    colors.each do |color|
      if !color.match(/^#[a-f0-9]{6}$/i)
        errors.add(:colors, "Colors must be formatted as hexadecimal codes")
      end
    end
  end
end
