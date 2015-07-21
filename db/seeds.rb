Item.destroy_all

User.destroy_all
Category.destroy_all

Rate.destroy_all




categories = Category.create([{ name: 'Art' }, { name: 'Cars' }, { name: 'Books' },
  { name: 'Collectibles' }, { name: 'Computers' }, { name: 'Electronics' },
  { name: 'Furniture' }, { name: 'Heavy Machinery' },
  { name: 'Jewelry' }, { name: 'Materials' }, { name: 'Mining Hardware' },
  { name: 'Sporting Goods' }, { name: 'Toys' }, { name: 'Vehicles' },
  { name: 'Wallets' },
  ])


users=User.create([{name: "Maxwell",
    email: "mmplisskin@gmail.com",

    admin: true}])

    rate = Rate.create([
      {average_rate:0}
      ])




30.times{ |i|
  sleep(1)
  items=Item.create({ name: "cool Item #{i}", category_id: '1', user_id: '1', description: "this cool item is item number #{i}", phone_number: "9255773668", price: "45#{i}", city: "Los Angeles", state: "Ca", zipcode: "90404"}
  )}



# User.all.each do |user|
#   10.times { |i| user.books << Book.create("Book number #{i}") }
# end

#
# t.integer  "user_id"
# t.integer  "category_id"
# t.string   "name"
# t.string   "description"
# t.string   "phone_number"
# t.string   "price"
# t.string   "city"
# t.string   "state"
# t.string   "zipcode"
# t.float    "latitude"
# t.float    "longitude"
