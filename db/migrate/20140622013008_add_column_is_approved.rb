class AddColumnIsApproved < ActiveRecord::Migration
  def change
  	add_column :spots, :is_approved, :boolean, {default: false}
  end
end
