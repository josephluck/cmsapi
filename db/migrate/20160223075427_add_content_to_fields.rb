class AddContentToFields < ActiveRecord::Migration
  def change
  	add_column :fields, :content, :json
  end
end
