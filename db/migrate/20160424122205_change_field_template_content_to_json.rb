class ChangeFieldTemplateContentToJson < ActiveRecord::Migration
  def change
  	remove_column :field_templates, :content
  	add_column :field_templates, :content, :json
  end
end
