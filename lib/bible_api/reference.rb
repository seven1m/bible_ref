require_relative './book'

module BibleApi
  class Reference

    attr_reader :reference

    def initialize(reference)
      @reference = reference
      (book_name, numbers) = split_book
      @book = Book.new(book_name).id
      (first_verse, last_verse) = split_numbers(numbers)
    end

    def range
      [
        { book: @book, chapter: @chapter, verse: @verse },
        { book: @book, chapter: @chapter, verse: @verse }
      ]
    end

    private

    def split_book
      # TODO smart regex here
      @reference.split
    end

    def split_numbers(numbers)
      chapter, verse = numbers.split(':', 2)
      (first_verse, last_verse) = verse.split('-')
      @chapter = chapter.to_i
      @verse = first_verse.to_i
    end

  end
end
