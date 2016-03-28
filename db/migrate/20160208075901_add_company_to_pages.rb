class AddCompanyToPages < ActiveRecord::Migration
  def change
  	add_reference :pages, :company, index: true
  end
end
