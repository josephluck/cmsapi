class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :section, index: true

      t.timestamps
    end
  end
end
