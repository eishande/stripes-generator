require 'rails_helper'

describe Dataset, type: :model do
  # it { should have_valid(:data).when("{5,4,3,2,1}") }
  # it { should_not have_valid(:data).when('{"a", "b", "c", "d", "e"}', "{3, 2, 1}") }
  let(:my_dataset) { Dataset.new(data: "45,32,46,21,24, 53, 31") }

  describe '#data_to_a' do
    it 'should be an array of integers' do
      expect(my_dataset.data_to_a[0]).to be_a(Numeric)
    end
  end

end
