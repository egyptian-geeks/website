class CreatePostTag < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tags do |t|
      t.integer :post_id, null: false
      t.integer :tag_id,  null: false

      t.timestamps

      t.index [:post_id, :tag_id], unique: true
    end
  end
end
