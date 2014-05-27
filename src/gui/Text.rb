module GUI
  class Text
    def initialize(text, font, x, y)
      @text = text
      @font = font
    end
    def draw
      @font.draw(@text, @x, @y, ZOrder::GUI_Text)
    end
  end
end