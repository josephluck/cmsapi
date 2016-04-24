class ChangeFieldTemplateContentToHStore < ActiveRecord::Migration
  def change
  	remove_column :field_templates, :content
  	add_column :field_templates, :content, :hstore
  end
end