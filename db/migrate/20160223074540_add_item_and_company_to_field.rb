class AddItemAndCompanyToField < ActiveRecord::Migration
  def change
    add_reference :fields, :company, index: true
    add_reference :fields, :item, index: true
  end
end
