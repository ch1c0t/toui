module Toui
  class Screen
    attr_accessor :elements

    def initialize
      @lines = []
    end

    def update
      clear
      escape '1;1H' # move to the top left corner
      line, column = 1, 1 # cursor position

      @elements.select(&:visible?).each do |element|
        if cursor = element.cursor
          line, column = (element.cursor.line+1), (element.cursor.column+1)
        end

        @lines += element.lines
      end

      print @lines.join "\r\n"
      escape "#{line};#{column}H"
    end

    def clear
      escape '2J'
      @lines.clear
    end

    private

    def escape code
      print "\e[#{code}"
    end
  end
end
