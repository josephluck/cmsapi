class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :site, index: true

      t.timestamps
    end
  end
end
