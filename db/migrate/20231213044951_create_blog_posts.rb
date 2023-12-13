class CreateBlogPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
