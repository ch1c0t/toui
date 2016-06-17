module Toui
  class Screen
    def initialize elements
      @elements = elements
    end

    def update
      escape '2J'   # clear
      escape '1;1H' # move to the top left corner
      print @elements.select(&:visible?).map(&:to_s).join "\r\n\r\n"
    end

    private

    def escape code
      print "\e[#{code}"
    end
  end
end
