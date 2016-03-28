class TeamMember < ActiveRecord::Base
	validates :email, uniqueness: true
end
