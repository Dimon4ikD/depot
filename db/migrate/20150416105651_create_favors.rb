class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.belongs_to :product, index: true
      t.boolean :tick, :default => false


      t.timestamps null: false
    end
    add_foreign_key :favors, :products
  end
end
