class CreateFieldAttributes < ActiveRecord::Migration
  def change
    create_table :field_attributes do |t|
    	t.references :field, index: true

      t.timestamps
    end
  end
end
