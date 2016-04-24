class AddColumnsToFieldTemplateAttributes < ActiveRecord::Migration
  def change
  	add_column :field_template_attributes, :name, :string
  	add_column :field_template_attributes, :type, :string
  	add_column :field_template_attributes, :options, :json
  end
end
