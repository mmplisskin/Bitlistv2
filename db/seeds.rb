Category.destroy_all
User.destroy_all
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
    # password: "123456",
    # password_confirmation: "123456",
    admin: true}])

    rate = Rate.create([
      {average_rate:0}
      ])
