class AddContentToFieldTemplates < ActiveRecord::Migration
  def change
  	add_column :field_templates, :content, :json
  end
end
