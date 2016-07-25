class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :rental_Cost, :integer
  end
end
