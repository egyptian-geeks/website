class AddLinkFieldsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :picture, :text
    add_column :posts, :name, :string
  end
end
