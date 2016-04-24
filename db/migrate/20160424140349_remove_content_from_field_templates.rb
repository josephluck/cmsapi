class RemoveContentFromFieldTemplates < ActiveRecord::Migration
  def change
  	remove_column :field_templates, :content
  end
end
