class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :band_id
      t.string :comment_text

      t.timestamps
    end
  end
end
