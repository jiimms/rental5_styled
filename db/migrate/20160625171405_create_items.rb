class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :coll
      t.string :price
      t.belongs_to :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
