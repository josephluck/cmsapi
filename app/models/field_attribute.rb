class FieldAttribute < ActiveRecord::Base
	belongs_to :company

	belongs_to :field
	belongs_to :field_template_attribute
end
