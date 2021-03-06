require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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
  
  scenario "They see all products" do
    # Act
    visit root_path

    # Debug / Saves PNG to tmp/capybara
    save_screenshot "home.png"

    # Verify
    expect(page).to have_css 'article.product', count: 10 
    # Makes sure there are 10 products being rendered with article with class name product
  end

end
