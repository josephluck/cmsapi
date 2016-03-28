class AddCompanyToItems < ActiveRecord::Migration
  def change
  	add_reference :items, :company, index: true
  end
end
