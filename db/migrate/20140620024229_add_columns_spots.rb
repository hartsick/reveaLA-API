class AddColumnsSpots < ActiveRecord::Migration
  def change
  	add_column :spots, :name, :string
  	add_column :spots, :type, :string
  	add_column :spots, :street, :string
  	add_column :spots, :state, :string
  	add_column :spots, :zip, :integer
  	add_column :spots, :created_by, :string
  	add_column :spots, :lnglat, :point, :geographic => true
  end
end
