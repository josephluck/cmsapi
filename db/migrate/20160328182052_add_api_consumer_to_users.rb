class AddApiConsumerToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :api_consumer, :boolean, :default => false
  end
end
