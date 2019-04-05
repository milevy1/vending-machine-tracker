require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @matts = @owner.machines.create(location: "Matts hot snacks")

    @cheetos = @dons.snacks.create(name: 'Cheetos', price: 1.50)
    @oreos = @dons.snacks.create(name: 'Oreos', price: 2.50)
    @fritos = @dons.snacks.create(name: 'Fritoes', price: 3.50)

    visit snack_path(@cheetos)
  end

  it 'shows the snack info' do
    expect(page).to have_content(@cheetos.name)
    expect(page).to have_content("Price: $#{@cheetos.price}")
  end

  it 'shows all vending machines with that snack' do
    expect(page).to have_content(@dons.location)
    expect(page).to have_content("Average price: $#{@dons.average_price}")
  end

end
