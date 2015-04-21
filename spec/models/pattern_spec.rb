require 'rails_helper'

describe Pattern, type: :model do
  let(:my_pattern) { FactoryGirl.build(:pattern) }

  describe "#colors_length" do
    context 'when colors is too short' do
      it 'adds an error' do
        my_pattern.colors = ["#452aab"]
        my_pattern.save
        expect(my_pattern).to_not be_valid
        expect(my_pattern.errors[:colors]).to include ":you must enter 5 colors"
      end
    end

    context 'when colors is long enough' do
      it 'does not add an error' do
        expect(my_pattern).to be_valid
        expect(my_pattern.errors[:colors]).to_not include ":you must enter 5 colors"
      end
    end
  end

  describe "#colors_hex_format" do
    context 'when colors are not properly formatted' do
      it 'adds an error' do
        my_pattern.colors = ["#56", "hsv", "#531", "#901", "r"]
        expect(my_pattern).to_not be_valid
        expect(my_pattern.errors[:colors]).to include "Colors must be in hexadecimal format"

      end
    end

    context 'when colors are properly formatted' do
      it 'does not add an error' do
        expect(my_pattern).to be_valid
        expect(my_pattern.errors[:colors]).to_not include "Colors must be in hexadecimal format"
      end
    end
  end
end
