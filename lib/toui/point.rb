module Toui
  class Point
    attr_accessor :line, :column
    def initialize area, line: 0, column: 0
      @area, @line, @column = area, line, column
    end


    def left number
      @column -= number
    end

    def right number
      @column += number
    end

    def up number
      @line -= number
    end

    def down number
      @line += number
    end
  end
end
