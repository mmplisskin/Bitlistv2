class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :location
      t.string :email
      t.string :image_url
      t.string :url
      t.boolean :admin, :default => false
      t.boolean :email_opt_in, :default => false

      t.timestamps null: false
    end
  end
end
