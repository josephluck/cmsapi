class AddFieldsToItems < ActiveRecord::Migration
  def change
  	add_column :items, :fields, :json
  end
end
