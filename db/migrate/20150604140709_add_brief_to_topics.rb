class AddBriefToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :brief, :text
  end
end
