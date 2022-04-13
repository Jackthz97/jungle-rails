require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

    # finds the first link with class name .btn.btn-default and clicks
    page.first('.btn.btn-default').click
    
    # 2 second delay before capturing screenshot
    sleep 2

    # saves screen shot under tmp/capybara
    save_screenshot "product_details.png"

    # test if pge have 
    expect(page).to have_css ('.products-show')
  end

end
