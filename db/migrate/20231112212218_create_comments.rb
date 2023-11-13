class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :commentText
      t.decimal :offer, precision: 10, scale: 2
      t.references :listing, null: false, foreign_key:true
      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
