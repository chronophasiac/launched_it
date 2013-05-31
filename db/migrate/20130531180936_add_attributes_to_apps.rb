class AddAttributesToApps < ActiveRecord::Migration
  def change
    add_column :apps, :name, :string
    add_column :apps, :url, :string
    add_column :apps, :codebase_url, :string
    add_column :apps, :description, :text
  end
end
