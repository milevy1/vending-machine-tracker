require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @cheetos = @dons.snacks.create(name: 'Cheetos', price: 1.50)
    @oreos = @dons.snacks.create(name: 'Oreos', price: 2)

    visit machine_path(@dons)
  end

  it 'shows the name of all of the snacks associated with that vending machine along with their price' do
    expect(page).to have_content(@cheetos.name)
    expect(page).to have_content("Price: $#{@cheetos.price}")

    expect(page).to have_content(@oreos.name)
    expect(page).to have_content("Price: $#{@oreos.price}")
  end


end
