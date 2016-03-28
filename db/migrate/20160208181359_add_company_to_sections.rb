class AddCompanyToSections < ActiveRecord::Migration
  def change
  	add_reference :sections, :company, index: true
  end
end
