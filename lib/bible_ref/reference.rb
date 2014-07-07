require_relative './book'
require_relative './parser'

module BibleRef
  class Reference

    attr_reader :book
    attr_reader :reference

    def initialize(reference)
      @reference = reference
      @details = parse
    end

    def ranges
      return nil unless valid?
      @chapter = nil
      [@details[:refs]].flatten.map do |ref|
        normalize_range(ref) || normalize_ref(ref)
      end
    end

    def book
      return nil unless @details
      @book ||= Book.new(@details[:book])
    end

    def valid?
      @details and book.id
    end

    def normalize
      book.formatted + ' ' +
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
        "#{ref[:chapter]}:#{ref[:verse]}"
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
        { book: @book.id, chapter: @chapter }.merge(range[:from]),
        { book: @book.id, chapter: @chapter }.merge(range[:to])
      ]
    end

    def normalize_ref(ref)
      @chapter = ref[:chapter] if ref[:chapter]
      (1..2).map do
        { book: @book.id, chapter: @chapter }.merge(ref)
      end
    end

  end
end
