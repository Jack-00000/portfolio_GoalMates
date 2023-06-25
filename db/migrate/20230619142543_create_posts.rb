class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.text :goal, null: false
      t.text :action, null: false

      t.timestamps
    end
  end
end
