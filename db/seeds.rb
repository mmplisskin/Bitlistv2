
User.destroy_all

Item.destroy_all

Category.destroy_all

Rate.destroy_all

rate = Rate.create


categories = Category.create([{ name: 'Art' }, { name: 'Cars' }, { name: 'Books' },
  { name: 'Collectibles' }, { name: 'Computers' }, { name: 'Electronics' },
  { name: 'Furniture' }, { name: 'Heavy Machinery' },
  { name: 'Jewelry' }, { name: 'Materials' }, { name: 'Mining Hardware' },
  { name: 'Sporting Goods' }, { name: 'Toys' }, { name: 'Vehicles' },
  { name: 'Wallets' },
  ])



users=User.create([{name: "ΜΔχ Πλισσκιν",
    email: "mmplisskin@gmail.com",
    provider: "facebook",
    uid: "10205188007553381",
    image_url: "http://graph.facebook.com/10205188007553381/picture",
    last_login: Time.now
    }])

    # users=User.create([{name: "ΜΔχ Πλισσκιν",
    #     email: "test@gmail",
    #     admin: false,
    #     provider: "facebook",
    #     uid: "10205188007553381",
    #     image_url: "http://graph.facebook.com/10205188007553381/picture"
    #
    #     }])


30.times{ |i|
  sleep(1)
  items=Item.create({ name: "cool Item #{i}", category_id: "1", user_id: '1', description: "this cool item is item number #{i} chemas social e-business productize mission-critical platforms proactive rss-capable. Citizen-media #{i}optimize iterate viral bricks-and-clicks; productize synergize life-hacks integrate synergies. il. Tag remix, real-time e-services monetize out-of-the-box architect; granular bleeding-edge supply-chains 24/7 social. Standards-compliant relationships citizen-media dynamic, communities portals, turn-key web-readiness e-business share semantic reinvent web services", phone_number: "5555555555", price: "45#{i}", city: "Los Angeles", state: "Ca", zipcode: "90404"}
  )
}



# items=Item.create({ name: "cool Item 2", category_id: '1', user_id: '14', description: "this cool item is item number 2 chemas social e-business productize mission-critical platforms proactive rss-capable. Citizen-media optimize iterate viral bricks-and-clicks; productize synergize life-hacks integrate synergies. Platforms, robust end-to-end long-tail. Tag remix, real-time e-services monetize out-of-the-box architect; granular bleeding-edge supply-chains 24/7 social. Standards-compliant relationships citizen-media dynamic, communities portals, turn-key web-readiness e-business share semantic reinvent web services", phone_number: "9255773668", price: "452", city: "Los Angeles", state: "Ca", zipcode: "90404"}
# )
