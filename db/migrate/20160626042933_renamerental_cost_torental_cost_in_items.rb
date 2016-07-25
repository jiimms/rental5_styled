class RenamerentalCostTorentalCostInItems < ActiveRecord::Migration
  def change
  	rename_column :items, :rental_Cost, :rental_cost
  end
end
