require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate all fields presence' do 
      @category = Category.new(:name => "Testing Category")
      @product = Product.new(:name => "Test Product", :price => 100, :quantity => 10, :category => @category)
      expect(@product.valid?).to be true
    end
  
    it 'should validate name presence' do 
      @product = Product.new
      @product.name = nil
      @product.validate
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it 'should validate price presence' do
      @product = Product.new
      @product.price = nil
      @product.validate
      expect(@product.errors[:price]).to include("can't be blank")
    end

    it 'should validate quantity presence' do
      @product = Product.new
      @product.quantity = nil
      @product.validate
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it 'should validate category presence' do
      @product = Product.new
      @product.category = nil
      @product.validate
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end
