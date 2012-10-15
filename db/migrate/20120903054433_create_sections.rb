class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :user
      t.references :story	
      t.string :name
      t.text :content
      t.integer :rating
      t.boolean :isPending , :default=>0
      t.timestamps
    end
  end
end
