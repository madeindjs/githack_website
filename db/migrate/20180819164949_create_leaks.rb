class CreateLeaks < ActiveRecord::Migration[5.2]
  def change
    create_table :leaks do |t|
      t.text :content
      t.belongs_to :repository

      t.timestamps
    end
  end
end
