class AddCounterToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :comments_count, :integer, default: 0, null: false
    add_column :posts, :reactions_count, :integer, default: 0, null: false
  end
end
