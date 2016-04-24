class RenameFieldTemplateAttributeTypeToKind < ActiveRecord::Migration
  def change
  	rename_column :field_template_attributes, :type, :kind
  end
end
