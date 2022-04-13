require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  #Setup
  before :each do 
    @category = Category.create!({name: 'Apparel'})
    10.times do |n|
      @category.products.create!({
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      })
    end
  end
  
  scenario "Navigates to home product details page" do
    # navigates to home page
    visit root_path

    # finds the add link
    page.first('.btn.btn-primary').click

    # expect page to have updated "My Cart (0)" to => "My Cart (1)"
    expect(page).to have_content "My Cart (1)"

    save_screenshot "updated_cart.png"
  end
end
