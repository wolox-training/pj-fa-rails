class AddBookTitleLimit < ActiveRecord::Migration[5.1]
  def change
    Book.all.each { |book| book.update(title: book.title.truncate(25)) }
    change_column :books, :title, :string, :limit => 25
  end
end
