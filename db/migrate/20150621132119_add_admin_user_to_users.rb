class AddAdminUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_user, :boolean, :default => false
  end
end
