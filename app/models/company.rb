class Company < ActiveRecord::Base
	validates :name, uniqueness: true
	after_create :create_site

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  has_many :sites, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_many :fields, :dependent => :destroy
  has_many :field_templates, :dependent => :destroy
  has_many :field_template_attributes, :dependent => :destroy

  def create_site
    Site.create(
      title: 'First site',
      company_id: self.id
    )
  end
end
