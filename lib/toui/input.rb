module Toui
  class Input
    include Element

    def initialize name:, block:, context:
      super
      @text, @keys = String.new, {}
      instance_exec &block
    end

    def << key
      if key.is_a? String && key.match? /[[:print:]]/
        @text << key
      else
        action = @keys[key] || @keys[:any]
        @context.instance_exec &action if action
      end
    end

    def on key, &action
      @keys[key] = action
    end

    attr_accessor :text
    def to_s
      @text
    end
  end
end
