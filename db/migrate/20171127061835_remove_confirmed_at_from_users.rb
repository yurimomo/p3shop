class RemoveConfirmedAtFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :confirmed_at, :integer
  end
end
