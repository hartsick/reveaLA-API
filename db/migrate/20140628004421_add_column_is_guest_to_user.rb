class AddColumnIsGuestToUser < ActiveRecord::Migration
  def change
  	add_column :users, :is_guest, :boolean, { default: true }
  end
end
