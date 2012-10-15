class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user	
      t.string :first_name
      t.string :last_name
      t.column :sex, "ENUM('male', 'female')" 
      t.timestamps
    end
  end
end
