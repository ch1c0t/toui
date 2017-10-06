module Toui
  class Input
    include Element

    def initialize name:, block:, context:
      super
      @visible = true
      @cursor = Point.new self
      @keys = {
        [:ctrl, ?c] => -> { exit },
        [:ctrl, ?u] => -> {
          own.text = String.new
          own.cursor.column = 0
        },
        [:ctrl, ?a] => -> { own.cursor.column = 0},
        [:ctrl, ?e] => -> { own.cursor.column = own[own.cursor.line].size },
        backspace: -> {
          unless own.cursor.column == 0
            own.text.slice! (own.cursor.column-1)
            own.cursor.left 1
          end
        }
      }
      instance_exec &block
    end

    def << key
      case key
      when Symbol, Array
        action = @keys[key]
        @context.own = self
        @context.instance_exec &action if action
      when /[[:print:]]/
        @text.insert @cursor.column, key
        @cursor.right 1
      end
    end

    def on key, &action
      @keys[key] = action
    end

    def lines
      [@text]
    end

    extend Forwardable
    delegate [:[]] => :lines

    def to_s
      @text
    end
  end
end
