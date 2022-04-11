require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'product presence to be true' do
      @category = Category.create(name: "Apparel")
      @product1 = @category.products.create({
        name: "Black T-shirt", 
        price_cents: 10, 
        quantity: 20,
        category: @category
      })
      expect(@product1).to be_valid
    end
  end

  describe 'Not validated' do 
    it 'product name presence is nil' do
      @category = Category.create(name: "Apparel")
      @product = @category.products.create({
        name: nil, 
        price_cents: 10, 
        quantity: 20,
        category: @category
      })
      expect(@product).to_not be_valid
      puts "Error message: #{@product.errors.full_messages}"
    end
  end

  describe 'Not validated' do 
    it 'product price presence is nil' do
      @category = Category.create(name: "Apparel")
      @product = @category.products.create({
        name: "Black T-shirt", 
        price_cents: nil,
        quantity: 20,
        category: @category
      })
      expect(@product).to_not be_valid
      puts "Error message: #{@product.errors.full_messages}"
    end
  end

  describe 'Not validated' do 
    it 'product quantity presence is nil' do
      @category = Category.create(name: "Apparel")
      @product = @category.products.create({
        name: "Black T-shirt", 
        price_cents: 10,
        quantity: nil,
        category: @category
      })
      expect(@product).to_not be_valid
      puts "Error message: #{@product.errors.full_messages}"
    end
  end

  describe 'Not validated' do 
    it 'category presence is nil' do
      @product = Product.create({
        name: "Black T-shirt", 
        price_cents: 10,
        quantity: 20,
        category: nil
      })
      expect(@product).to_not be_valid
      puts "Error message: #{@product.errors.full_messages}"
    end
  end
end
