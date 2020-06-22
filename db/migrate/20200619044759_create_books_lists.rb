class CreateBooksLists < ActiveRecord::Migration[5.2]
  def change
    create_table :books_lists do |t|
      t.integer :book_id
      t.integer :list_id
    end
  end
end
