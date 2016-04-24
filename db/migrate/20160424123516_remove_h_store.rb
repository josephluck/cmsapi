class RemoveHStore < ActiveRecord::Migration
  def up
    execute "DROP EXTENSION IF EXISTS hstore"
  end
end
