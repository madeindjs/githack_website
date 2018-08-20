class AddStatusToLeaks < ActiveRecord::Migration[5.2]
  def change
    add_column :leaks, :status, :integer, default: 0
  end
end
