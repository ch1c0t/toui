module Toui
  Keyboard = Enumerator.new do |y|
    loop do
      key = case (key = STDIN.getch)
            when "\r"
              :enter
            when "\t"
              :tab
            when "\u0003"
              [:ctrl, ?c]
            when "\u0015"
              [:ctrl, ?u]
            when "\u0001"
              [:ctrl, ?a]
            when "\u0005"
              [:ctrl, ?e]
            when "\u007F"
              :backspace
            else
              key
            end
      y << key
    end
  end
end
