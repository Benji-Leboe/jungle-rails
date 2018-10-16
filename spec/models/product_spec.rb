# require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     it 'should validate all fields' do
#       @category = Category.create(name: 'test')
#       @product = @category.products.create!(name: 'test', price_cents: 1000, quantity: 5, category_id: @category.id)

#       expect(@product).to be_valid
#     end
#     it 'should validate presence of name' do
#       @category = Category.create(name: 'test')
#       @product = @category.products.create!(price_cents: 1000, quantity: 5, category_id: @category.id)
#       expect(@product.name).to be_valid
#     end
#     it 'should validate presence of price' do
#       @category = Category.create(name: 'test')
#       @product = @category.products.create!(name: 'test', quantity: 5, category_id: @category.id)
#       expect(@product.price_cents).to be_valid
#     end
#     it 'should validate presence of quantity' do
#       @category = Category.create(name: 'test')
#       @product = @category.products.create!(name: 'test', price_cents: 1000, category_id: @category.id)
#       expect(@product.quantity).to be_valid
#     end
#     it 'should validate presence of category' do
#       @category = Category.create(name: 'test')
#       @product = @category.products.create!(name: 'test', price_cents: 1000, quantity: 5)
#       expect(@product.category_id).to be_valid
#     end
#   end
# end
