class AddFieldTemplateToItems < ActiveRecord::Migration
  def change
  	add_reference :items, :field_template, index: true
  end
end
