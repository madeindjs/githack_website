class AddFrameworkToRepository < ActiveRecord::Migration[5.2]
  def change
    add_column :repositories, :framework, :integer, default: 0
  end
end
