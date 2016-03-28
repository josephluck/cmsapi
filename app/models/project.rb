class Project < ActiveRecord::Base
	validates :title, presence: true

	# Can only create a project if the company it belongs to exists.
	validates :company, :presence => true, :associated => true

	belongs_to :company
	has_many :user_projects
  has_many :users, :through => :user_projects
end
