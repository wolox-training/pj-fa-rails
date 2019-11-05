class OpenLibraryService
  def self.execute(isbn)
    include HTTParty
    base_uri 'https://openlibrary.org/api/books'
    response = get('/', query: { bibkeys: "ISBN:#{isbn}", jscmd: 'data', format: 'json' })

    if response["ISBN:#{isbn}"].present?
      response["ISBN:#{isbn}"].slice('title', 'subtitle', 'number_of_pages', 'authors')
    else
      Exception.new('Book not Found')
    end
  end
end
