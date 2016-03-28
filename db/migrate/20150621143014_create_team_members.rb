class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :email
      t.string :company_name
      t.integer :company_id
      t.boolean :admin_user, :default => false

      t.timestamps
    end
  end
end
