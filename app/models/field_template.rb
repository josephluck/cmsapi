class FieldTemplate < ActiveRecord::Base
	validates :title,
		presence: true,
		uniqueness: {
			message: "This field name already exists"
		},
		format: {
			with: /\A[a-zA-Z0-9_]*\Z/,
			message: "Please only alphanumeric with underscores"
		}
end
