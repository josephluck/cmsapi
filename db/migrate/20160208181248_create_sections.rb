class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :page, index: true

      t.timestamps
    end
  end
end
