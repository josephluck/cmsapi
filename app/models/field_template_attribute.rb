class FieldTemplateAttribute < ActiveRecord::Base
	# validates :title,
	# 	presence: true,
	# 	uniqueness: {
	# 		message: "This field name already exists"
	# 	}
		# format: {
		# 	with: /\A[a-zA-Z0-9_]*\Z/,
		# 	message: "Please only alphanumeric with underscores"
		# }

	belongs_to :company
	belongs_to :field_template

	has_many :field_attributes, :dependent => :destroy
end
