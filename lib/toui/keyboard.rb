module Toui
  Keyboard = Enumerator.new do |y|
    loop do
      key = case (key = STDIN.getch)
            when "\r"
              :enter
            when "\t"
              :tab
            else
              key
            end
      y << key
    end
  end
end
