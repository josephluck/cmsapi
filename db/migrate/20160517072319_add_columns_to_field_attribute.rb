class AddColumnsToFieldAttribute < ActiveRecord::Migration
  def change
  	add_reference :field_attributes, :company, index: true
  	# add_reference :field_attributes, :field, index: true --- not needed since field relation was created when field_attributes was created --- see earlier migration
  	add_reference :field_attributes, :field_template_attribute, index: true
  end
end



# NEED TO RUN RAKE DB:MIGRATE AFTER CHECKING THESE ASSOCIATIONS WORK
