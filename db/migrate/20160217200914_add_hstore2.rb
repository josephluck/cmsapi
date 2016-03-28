class AddHstore2 < ActiveRecord::Migration
  def up
    enable_extension :hstore
  end
end
