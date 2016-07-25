class AddBrandToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_for_rent, :string
    add_column :items, :brand, :string
  end
end
