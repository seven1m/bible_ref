module BibleRef
  module Languages
    class Base
      def books
        fail NotImplementedError, "You must override #books in your language class."
      end

      def book_id(book_name, canon)
        book_name = replace_roman_numerals(book_name.downcase)
        return book_name.upcase if books[book_name.upcase] # already normalized
        canon.books.each do |book|
          match = books[book][:match]
          return book if book_name =~ match
        end
        nil
      end

      def book_name(book_name, canon)
        return unless id = book_id(book_name, canon)
        books[id][:name]
      end

      def replace_roman_numerals(book)
        book.sub!(/^iii/i, '3')
        book.sub!(/^ii/i, '2')
        book.sub!(/^i/i, '1')
        book
      end
    end
  end
end
