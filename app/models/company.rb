class Company < ActiveRecord::Base
	validates :name, uniqueness: true
	after_create :create_admin_user_account, :create_site

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users
  has_many :projects
  has_many :sites
  has_many :pages
  has_many :sections
  has_many :items
  has_many :fields
  has_many :field_templates

  def create_admin_user_account
  	User.create(
  		email: self.email,
  		password: self.password,
  		password_confirmation: self.password,
  		company_id: self.id,
  		company_name: self.name,
  		admin_user: true
  	)
  end

  def create_site
    Site.create(
      title: 'First site',
      company_id: self.id
    )
  end
end
