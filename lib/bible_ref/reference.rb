require_relative './languages'
require_relative './canons'
require_relative './parser'

module BibleRef
  class Reference
    attr_reader :book, :reference, :language, :canon

    # Create a new Reference instance by passing in the user-supplied bible reference as a string.
    def initialize(reference, language: 'eng', canon: 'all')
      @reference = reference
      @details = parse
      @language = language.respond_to?(:book_id) ? language : LANGUAGES.fetch(language.to_s).new
      @canon = canon.respond_to?(:books) ? canon : CANONS.fetch(canon.to_s).new
    end

    # Returns an array of pairs, each one being the from and to for a range.
    # For single verses, the same ref is repeated twice. This is most helpful
    # for converting the entire passage into a SQL query, and in fact is exactly
    # why this library was built. See https://github.com/seven1m/bible_api/blob/master/app.rb
    # for an example.
    def ranges
      return nil unless valid?
      @chapter = nil
      [@details[:refs]].flatten.map do |ref|
        normalize_range(ref) || normalize_ref(ref)
      end
    end

    # Returns a USFX-compatible book id, or nil if book is unknown.
    def book_id
      return nil unless @details
      @book_id ||= @language.book_id(@details[:book], @canon)
    end

    # Returns the formatted book name
    def book_name
      return nil unless @details
      @book_name ||= @language.book_name(@details[:book], @canon)
    end

    # Returns true if the reference is a known bible passage.
    def valid?
      @details && !book_id.nil?
    end

    # Returns a normalized passage reference. e.g.
    #
    # 'JOHN 3:16&17' => 'John 3:16,17'
    def normalize
      return unless book_id and ranges
      book_name + ' ' +
      ranges.map do |(ref_from, ref_to)|
        if ref_from != ref_to
          ref_part(ref_from) + '-' + ref_part(ref_to)
        else
          ref_part(ref_from)
        end
      end.join(',')
    end

    private

    def ref_part(ref)
      if @last_chapter != ref[:chapter] and ref[:chapter]
        @last_chapter = ref[:chapter]
        if ref[:verse]
          "#{ref[:chapter]}:#{ref[:verse]}"
        else
          ref[:chapter]
        end
      else
        ref[:verse].to_s
      end
    end

    def parse
      begin
        parsed = Parser.new.parse(@reference)
      rescue Parslet::ParseFailed
        nil
      else
        ParserTransform.new.apply(parsed)
      end
    end

    def normalize_range(ref)
      return unless range = ref[:range]
      ch = range.detect { |_, r| r[:chapter] }
      @chapter = ch.last[:chapter] if ch
      [
        { book: book_id, chapter: @chapter }.merge(range[:from]),
        { book: book_id, chapter: @chapter }.merge(range[:to])
      ]
    end

    def normalize_ref(ref)
      @chapter = ref[:chapter] if ref[:chapter]
      (1..2).map do
        { book: book_id, chapter: @chapter }.merge(ref)
      end
    end

  end
end
