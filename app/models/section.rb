class Section < ActiveRecord::Base
	validates :title,
		presence: true,
		uniqueness: {
			scope: :page,
			message: "This section name already exists"
		}
		# format: {
		# 	with: /\A[a-zA-Z0-9_]*\Z/,
		# 	message: "Please only alphanumeric with underscores"
		# }

	# Can only create a section if the page it belongs to exists.
	# validates :page, :presence => true, :associated => true

  belongs_to :page
  belongs_to :company
  has_many :items
end
