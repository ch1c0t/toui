module Toui
  class Input
    include Element

    def initialize name:, block:, context:
      super
      @visible = true
      @keys = {
        [:ctrl, ?c] => -> { exit },
        [:ctrl, ?u] => -> { own.text = String.new },
        backspace: -> { own.text = own.text[0..-2] }
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
        @text << key
      end
    end

    def on key, &action
      @keys[key] = action
    end

    def to_s
      @text
    end
  end
end
