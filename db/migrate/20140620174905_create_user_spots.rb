class CreateUserSpots < ActiveRecord::Migration
  def change
    create_table :user_spots do |t|
      t.references :user, index: true
      t.references :spot, index: true

      t.timestamps
    end
  end
end
