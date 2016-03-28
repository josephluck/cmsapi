class AddTitleToSections < ActiveRecord::Migration
  def change
  		add_column :sections, :title, :string
  end
end
