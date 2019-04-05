require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  describe 'instance methods' do
    describe '.average_price' do
      it 'returns the average price of all snacks in a machine' do
        @owner = Owner.create(name: "Sam's Snacks")
        @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
        @cheetos = @dons.snacks.create(name: 'Cheetos', price: 1.50)
        @oreos = @dons.snacks.create(name: 'Oreos', price: 2)

        expect(@dons.average_price).to eq(1.75)
      end
    end
  end
end
