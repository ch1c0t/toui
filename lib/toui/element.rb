module Toui
  module Element
    attr_accessor :text
    def initialize name:, block:, context:
      @name, @block, @context = name, block, context
      @text = String.new
      @visible = false
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
