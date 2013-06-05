class CreateProps < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.integer :user_id, :null => false
      t.integer :app_id, :null => false

      t.timestamps
    end
  end
end
