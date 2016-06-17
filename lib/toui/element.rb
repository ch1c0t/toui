module Toui
  module Element
    def initialize name:, block:, context:
      @name, @block, @context = name, block, context
    end

    attr_accessor :visible
    def visible?
      @visible
    end

    def show
      @visible = true
    end

    def hide
      @visible = false
    end
  end
end
