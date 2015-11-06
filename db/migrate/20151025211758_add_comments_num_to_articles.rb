class AddCommentsNumToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :comments_num, :integer
  end
end
