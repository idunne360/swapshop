class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.datetime :date
      t.string :poster
      
      t.timestamps
    end
  end
end
