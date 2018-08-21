class AddFrameworkToRepository < ActiveRecord::Migration[5.2]
  def change
    Repository.delete_all
    add_column :repositories, :framework, :string, not_null: true
  end
end
