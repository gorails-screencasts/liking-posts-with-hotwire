class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :likes_count, default: 0

      t.timestamps
    end
  end
end
