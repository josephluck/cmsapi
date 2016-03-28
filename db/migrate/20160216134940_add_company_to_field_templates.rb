class AddCompanyToFieldTemplates < ActiveRecord::Migration
  def change
    add_reference :field_templates, :company, index: true
  end
end
