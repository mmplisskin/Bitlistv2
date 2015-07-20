class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :average_rate

      t.timestamps null: false
    end
  end
end
