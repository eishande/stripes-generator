class Pattern < ActiveRecord::Base
  belongs_to :user
  belongs_to :dataset

  validates :user, presence: true
  validates :dataset, presence: true
  validates :colors, presence: true

  validate :colors_length
  validate :colors_hex_format

  def colors_length
    if colors.length != 5
      errors.add(:colors, ":you must enter 5 colors")
    end
  end

  def colors_hex_format
    colors.each do |color|
      if !color.match(/^#[a-f0-9]{6}$/i)
        errors.add(:colors, "must be formatted as hexadecimal codes")
        break
      end
    end
  end
end
