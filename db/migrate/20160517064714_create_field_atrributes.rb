class CreateFieldAtrributes < ActiveRecord::Migration
  def change
    create_table :field_atrributes do |t|
    	t.references :field, index: true

      t.timestamps
    end
  end
end
