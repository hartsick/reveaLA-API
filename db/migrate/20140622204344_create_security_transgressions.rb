class CreateSecurityTransgressions < ActiveRecord::Migration
  def change
    create_table :security_transgressions do |t|

      t.timestamps
    end
  end
end
