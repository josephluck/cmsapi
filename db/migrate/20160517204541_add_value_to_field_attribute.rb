class AddValueToFieldAttribute < ActiveRecord::Migration
  def change
  	add_column :field_template_attributes, :value, :string
  end
end
