# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = [
  {product_code: "A", unit_price: 2.00, bundle_size: 5, bundle_price: 9.0},
  {product_code: "B", unit_price: 10.00, bundle_size: 0, bundle_price: 0.0},
  {product_code: "C", unit_price: 1.25, bundle_size: 6, bundle_price: 6.0},
  {product_code: "D", unit_price: 0.15, bundle_size: 0, bundle_price: 0.0},
  {product_code: "E", unit_price: 2.00, bundle_size: 5, bundle_price: 0.0}
]
products.each do |product|
  Product.create(product)
end
  
