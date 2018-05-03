class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.integer :user_id
      t.string :band_bio
      t.string :band_img
      t.string :band_categ
      t.string :band_name

      t.timestamps
    end
  end
end
