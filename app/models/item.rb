class Item < ActiveRecord::Base
	validates :title,
		presence: true
		# uniqueness: {
		# 	scope: :section,
		# 	message: "This item name already exists"
		# }
		# format: {
		# 	with: /\A[a-zA-Z0-9_]*\Z/,
		# 	message: "Please only alphanumeric with underscores"
		# }

	# Can only create a item if the section it belongs to exists.
	# validates :section, :presence => true, :associated => true

  belongs_to :section
  belongs_to :company

  has_many :fields, :dependent => :destroy
  accepts_nested_attributes_for :fields,
  	:allow_destroy => true,
  	:reject_if => :all_blank

end
