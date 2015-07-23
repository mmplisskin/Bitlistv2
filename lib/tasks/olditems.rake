namespace :clear do
  desc "Clears out old items"
  task :olditems => :environment do
    puts "######### preparing to delete old items ################"

     items = Item.where("created_at < ?", 24.days.ago)
     items.destroy_all
  end
    puts "Items have been destroyed"
end
