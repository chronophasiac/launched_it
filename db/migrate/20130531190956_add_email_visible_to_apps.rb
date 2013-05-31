class AddEmailVisibleToApps < ActiveRecord::Migration
  def change
    add_column :apps, :email_visible, :boolean, default: false, null: false
  end
end
