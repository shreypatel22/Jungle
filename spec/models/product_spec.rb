require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "should save with all four fields" do
      @category = Category.new(name: "EverShrubs")
      @product = Product.new(
        name: "name",
        price_cents: 50000,
        quantity: 3,
        category: @category
      )
      # would not need this if you did .create instead of .new since .create will save it at the same time
      @product.save
      # to be_present doesnt work, since it will still be there
      expect(@product).to be_valid
    end

    it "should not save without a name" do
      @category = Category.new(name: "EverShrubs")
      @product = Product.new(
        name: nil,
        price_cents: 20000,
        quantity: 3,
        category: @category
      )

      @product.save    
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not save without a price" do
      @category = Category.new(name: "EverShrubs")
      @product = Product.new(
        name: "name",
        price_cents: nil,
        quantity: 3,
        category: @category
      )

      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should not save without a quantity" do
      @category = Category.new(name: "EverShrubs")
      @product = Product.new(
        name: "name",
        price_cents: 20000,
        quantity: nil,
        category: @category
      )

      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not save without a category" do      
      @product = Product.new(
        name: "name",
        price_cents: 20000,
        quantity: 2,
        category: nil
      )

      @product.save      
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
