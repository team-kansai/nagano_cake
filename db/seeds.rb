Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

15.times do |n|
  Customer.create!(
    last_name: "田中",
    first_name: "太朗#{n + 1}",
    last_name_kana: "タナカ",  
    first_name_kana: "タロウ#{n + 1}",
    email: "test#{n + 1}@test",
    postcode: "111-1111",
    address: "東京都中央区銀座",
    phone_number: "111-1111-1111",
    password: "testtest",
    is_deleted: "0"
  )
end

5.times do |n|
  ShippingAddress.create!(
    customer_id: 1,
    postcode: "222-222#{n + 1}",
    address: "大阪府大阪市#{n + 1}",
    name: "鈴木#{n + 1}",
  )
end

5.times do |n|
  Genre.create!(
    name: "ジャンル#{n + 1}"
  )
end

10.times do |n|
  Product.create!(
    genre_id: 1,
    name: "商品#{n + 1}",
    description: "商品説明#{n + 1}",
    price: 1000,
    is_active: true
  )
end

