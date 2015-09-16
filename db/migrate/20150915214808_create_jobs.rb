class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :url
      t.text :description
      t.integer :user_id
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
