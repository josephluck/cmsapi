class CreateFieldTemplates < ActiveRecord::Migration
  def change
    create_table :field_templates do |t|

      t.timestamps
    end
  end
end
