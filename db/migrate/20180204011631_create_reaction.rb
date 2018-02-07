class CreateReaction < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.string :type, null: false
      t.string :fid, null: false

      t.timestamps

      t.index :fid, unique: true
    end
  end
end
