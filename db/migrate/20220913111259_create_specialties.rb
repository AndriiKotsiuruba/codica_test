class CreateSpecialties < ActiveRecord::Migration[6.1]
  def change
    create_table :specialties do |t|
      t.string :name

      t.timestamps
    end

    add_index :specialties, :name, unique: true
  end
end
