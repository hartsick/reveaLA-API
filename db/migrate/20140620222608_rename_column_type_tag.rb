class RenameColumnTypeTag < ActiveRecord::Migration
  def change
  	rename_column :spots, :type, :tag
  end
end
