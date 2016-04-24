class CreateFieldTemplateAttributes < ActiveRecord::Migration
  def change
    create_table :field_template_attributes do |t|
    	t.references :company, index: true
    	t.references :field_template, index: true

    	t.timestamps
    end
  end
end
