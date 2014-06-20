class AddColumnSpotsCity < ActiveRecord::Migration
  def change
  	add_column :spots, :city, :string
  end
end
