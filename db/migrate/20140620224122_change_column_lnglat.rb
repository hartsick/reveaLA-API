class ChangeColumnLnglat < ActiveRecord::Migration
  def change
  	change_column :spots, :lnglat, :point, :geographic => true
  end
end
