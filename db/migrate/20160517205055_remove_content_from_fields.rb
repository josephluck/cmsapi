class RemoveContentFromFields < ActiveRecord::Migration
  def change
  	remove_column :fields, :content, :json
  end
end
