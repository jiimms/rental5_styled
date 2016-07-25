class RemoveColumnFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :coll, :string
    remove_column :items, :price, :string
  end
end
