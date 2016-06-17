module Toui
  class View
    include Element

    def to_s
      @text = @context.instance_exec &@block
    end

    def first
      @text.split(/\n/).first
    end
  end
end
