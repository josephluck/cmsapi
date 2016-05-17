class RemoveValueFromFieldTemplateAttributeAndAddItToFieldAttribute < ActiveRecord::Migration
  def change
  	remove_column :field_template_attributes, :value, :string
  	add_column :field_attributes, :value, :string
  end
end
