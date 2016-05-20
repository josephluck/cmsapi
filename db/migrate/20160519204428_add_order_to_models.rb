class AddOrderToModels < ActiveRecord::Migration
  def change
  	add_column :pages, :order, :integer
  	add_column :sections, :order, :integer
  	add_column :items, :order, :integer
  	add_column :field_templates, :order, :integer
  end
end
