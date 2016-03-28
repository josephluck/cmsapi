class AddHStore < ActiveRecord::Migration
  def up
    enable_extension :hstore
  end
end
