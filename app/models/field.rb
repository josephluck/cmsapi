class Field < ActiveRecord::Base
	belongs_to :company
	belongs_to :item

	has_many :field_attributes, :dependent => :destroy
  accepts_nested_attributes_for :field_attributes,
  	:allow_destroy => true,
  	:reject_if => :all_blank
end
