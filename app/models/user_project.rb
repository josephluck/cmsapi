class UserProject < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	# Only create association if it doesn't already exist
	# (i.e project already belongs to user)
	validates_uniqueness_of :user_id, :scope => :project_id
	validate :user_and_project_belong_to_same_company

	private
	def user_and_project_belong_to_same_company
		if self.user.company.id != self.project.company.id
			errors.add(:base, "You can only assign users from the same company to a project")
		end
	end
end
