class AddCompanyToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :company, index: true
  end
end
