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


# users=User.create([{name: "Maxwell",
#     email: "mmplisskin@gmail.com",
#
#     admin: true}])
#
#     rate = Rate.create([
#       {average_rate:0}
#       ])


#
# 12.times do |j|

30.times{ |i|
  sleep(1)
  items=Item.create({ name: "cool Item #{i}", category_id: '1', user_id: '1', description: "this cool item is item number #{i} chemas social e-business productize mission-critical platforms proactive rss-capable. Citizen-media optimize iterate viral bricks-and-clicks; productize synergize life-hacks integrate synergies. Platforms, robust end-to-end long-tail. Tag remix, real-time e-services monetize out-of-the-box architect; granular bleeding-edge supply-chains 24/7 social. Standards-compliant relationships citizen-media dynamic, communities portals, turn-key web-readiness e-business share semantic reinvent web services", phone_number: "9255773668", price: "45#{i}", city: "Los Angeles", state: "Ca", zipcode: "90404"}
  )}

# end

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
