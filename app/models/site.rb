class Site < ActiveRecord::Base
  validates :title, presence: true

  # Can only create a site if the company it belongs to exists.
  validates :company, :presence => true, :associated => true

  belongs_to :company
  has_many :pages
end
