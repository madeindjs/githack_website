class AddInformationsToLeaks < ActiveRecord::Migration[5.2]
  def change
    Leak.delete_all
    add_column :leaks, :sha, :string, not_null: true
    add_column :leaks, :file, :string, not_null: true
  end
end
