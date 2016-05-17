class Field < ActiveRecord::Base
	belongs_to :company
	belongs_to :item

	has_many :field_attributes, autosave: true, :dependent => :destroy
end
