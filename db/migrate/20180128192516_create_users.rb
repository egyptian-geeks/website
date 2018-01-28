class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :fid

      t.timestamps
    end
    add_column :posts, :user_id, :integer
  end
end
