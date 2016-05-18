class Page < ActiveRecord::Base
  validates :title,
  	presence: true,
    uniqueness: {
      scope: :site,
      message: "This page name already exists"
    }
  	# format: {
  	# 	with: /\A[a-zA-Z0-9_]*\Z/,
  	# 	message: "Please only alphanumeric with underscores"
  	# }

  # Can only create a page if the site it belongs to exists.
  validates :site, :presence => true, :associated => true

  belongs_to :site
  belongs_to :company
  has_many :sections, :dependent => :destroy
end
