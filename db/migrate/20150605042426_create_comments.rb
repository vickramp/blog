class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :topic_id
      t.integer :user_id
      t.string :comment_body

      t.timestamps
    end
  end
end
