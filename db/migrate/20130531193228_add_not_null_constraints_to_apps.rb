class AddNotNullConstraintsToApps < ActiveRecord::Migration
  def up
    change_column :apps, :name, :string, null: false
    change_column :apps, :description, :text, null: false
    change_column :apps, :url, :string, null: false
    change_column :apps, :codebase_url, :string, null: false
  end

  def down
    change_column :apps, :name, :string, null: true
    change_column :apps, :description, :text, null: true
    change_column :apps, :url, :string, null: true
    change_column :apps, :codebase_url, :string, null: true
  end
end
