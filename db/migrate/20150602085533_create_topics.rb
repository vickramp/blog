class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :picture

      t.timestamps
    end
  end
end
