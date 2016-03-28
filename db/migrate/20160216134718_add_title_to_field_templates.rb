class AddTitleToFieldTemplates < ActiveRecord::Migration
  def change
    add_column :field_templates, :title, :string
  end
end
