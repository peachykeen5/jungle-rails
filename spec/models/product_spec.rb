require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a new product if all fields are complete' do
      @category = Category.find_or_create_by! name: "Apparel"
      @product = @category.products.create!({
        name:  'Hipster Socks',
        quantity: 8,
        price: 25.00
      })
      expect(@product.id).to be_present
    end

    it 'should not create a product if it does not belong to a category' do
      @product = Product.new({
        name:  'Hipster Socks',
        quantity: 8,
        price: 25.00
      })
      expect(@product.id).to be_nil
    end

    it 'should prevent product creation if name is missing' do
      @category = Category.find_or_create_by! name: "Apparel"
      @product = @category.products.create({
        quantity: 8,
        price: 25.00
      })
      expect(@product.id).to be_nil
    end

    it 'should prevent product creation if price is missing' do
      @category = Category.find_or_create_by! name: "Apparel"
      @product = @category.products.create({
        name: 'Hipster Socks',
        quantity: 8
      })
      expect(@product.id).to be_nil
    end

    it 'should prevent product creation if quantity is missing' do
      @category = Category.find_or_create_by! name: "Apparel"
      @product = @category.products.create({
        name: 'Hipster Socks',
        price: 25.00
      })
      expect(@product.id).to be_nil
    end
  end
end
