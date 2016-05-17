class FieldTemplate < ActiveRecord::Base
	# validates :title,
	# 	presence: true,
	# 	uniqueness: {
	# 		message: "This field name already exists"
	# 	}
		# format: {
		# 	with: /\A[a-zA-Z0-9_]*\Z/,
		# 	message: "Please only alphanumeric with underscores"
		# }

	belongs_to :site
	belongs_to :company

	has_many :field_template_attributes, autosave: true, :dependent => :destroy
	has_many :items
end
