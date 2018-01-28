class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :message
      t.text :link
      t.string :type, null: false
      t.text :permalink_url, null: false
      t.string :fid, null: false

      t.timestamps

      t.index :fid, unique: true
      t.index :permalink_url, unique: true
    end
  end
end
