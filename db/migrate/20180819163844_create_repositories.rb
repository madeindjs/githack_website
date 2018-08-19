class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :url, index: true, unique: true

      t.timestamps
    end
  end
end
