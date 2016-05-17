class RemoveFieldsColumnFromItems < ActiveRecord::Migration
  def change
  	remove_column :items, :fields
  end
end
