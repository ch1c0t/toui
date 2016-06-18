module Toui
  class Input
    include Element

    def initialize name:, block:, context:
      super
      @visible, @keys = true, {}
      instance_exec &block
    end

    def << key
      case key
      when "\u0003" # C-c
        exit
      when "\u0015" # C-u
        @text = String.new
      when Symbol
        action = @keys[key]
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
