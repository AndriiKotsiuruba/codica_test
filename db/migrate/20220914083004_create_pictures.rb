class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.references :imageable, polymorphic: true
      t.text :image_data

      t.timestamps
    end
  end
end
