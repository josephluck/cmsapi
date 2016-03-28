class Field < ActiveRecord::Base
	belongs_to :company
	belongs_to :item
end
