module Toui
  class Screen
    attr_accessor :elements

    def update
      clear
      escape '1;1H' # move to the top left corner
      print @elements.select(&:visible?).map(&:to_s).join "\r\n\r\n"
    end

    def clear
      escape '2J'
    end

    private

    def escape code
      print "\e[#{code}"
    end
  end
end
