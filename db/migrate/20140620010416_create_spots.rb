class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
    	t.string :name
    	t.string :type
    	t.string :street
    	t.string :city
    	t.string :state
    	t.integer :zip
    	t.string :created_by
	    t.spatial :lnglat, limit: {:srid=>4326, :type=>"point", :geographic=>true}

      t.timestamps
    end
  end
end
