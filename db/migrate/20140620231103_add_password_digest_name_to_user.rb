class AddPasswordDigestNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :name, :string
  end
end
