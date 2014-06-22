class ChangeColumnSpotsZip < ActiveRecord::Migration
  def change
  	change_column :spots, :zip, :string
  end
end
