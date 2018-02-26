class CreateTag < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :title
      t.integer :posts_count, default: 0, null: false

      t.timestamps

      t.index :title, unique: true
    end
  end
end
