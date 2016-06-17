module Toui
  class App
    def initialize &block
      @elements = []

      @screen = Screen.new
      @context = Object.new

      instance_exec &block
    end

    def run
      loop do
        current_input << Keyboard.next
        @screen.update
      end
    end

    private
      def current_input
        @elements.find { |e| e.is_a? Input }
      end

      def input name, &block
        input = Input.new name: name, block: block, context: @context
        @context.define_singleton_method(name) { input }
        @elements << input
      end

      def view name, &block
        view = View.new name: name, block: block, context: @context
        @context.define_singleton_method(name) { view }
        @elements << view
      end
  end
end