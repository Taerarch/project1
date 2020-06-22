class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.text :image
      t.integer :author_id

      t.timestamps
    end
  end
end
