class OpenLibraryService
  def self.execute(isbn)
    book = HTTParty.get(
      "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&jscmd=data&format=json"
    )
    data = {}
    data[:isbn] = isbn
    data[:title] = book["ISBN:#{isbn}"]['title']
    data[:subtitle] = book["ISBN:#{isbn}"]['subtitle']
    data[:number_of_pages] = book["ISBN:#{isbn}"]['number_of_pages']
    data[:authors] = book["ISBN:#{isbn}"]['authors']
    data
  end
end
