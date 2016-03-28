class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :company, index: true

      t.timestamps
    end
  end
end
