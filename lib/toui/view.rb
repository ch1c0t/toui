module Toui
  class View
    include Element

    def lines
      @context.instance_exec &@block
    end
  end
end
