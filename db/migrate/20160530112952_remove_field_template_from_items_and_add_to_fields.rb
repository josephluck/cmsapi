class RemoveFieldTemplateFromItemsAndAddToFields < ActiveRecord::Migration
  def change
  	remove_column :items, :field_template_id
  	add_reference :fields, :field_template, index: true
  end
end
