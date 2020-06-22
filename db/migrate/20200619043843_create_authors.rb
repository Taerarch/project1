class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :dob
      t.string :nationality
      t.text :image

      t.timestamps
    end
  end
end
