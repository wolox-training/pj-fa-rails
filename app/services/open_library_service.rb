class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org/api/books'

  def self.execute(isbn)
    response = get('/', query: { bibkeys: "ISBN:#{isbn}", jscmd: 'data', format: 'json' })

    raise ActiveRecord::RecordNotFound, 'Book not found' if response.parsed_response.empty?
    response["ISBN:#{isbn}"].slice('title', 'subtitle', 'number_of_pages', 'authors')
  end
end
