class Player < FloatingEntity
  WIDTH, HEIGHT = 27, 22
  attr_accessor :KbLeft, :KbRight

  def initialize(images, x, y, hp, speed)
    super images, x, y, hp, speed
    @KbLeft = false
    @KbRight = false
  end

  def update
    super
    
    if @x + @velocity_x < GameWindow::WIDTH and @x + @velocity_x > 0
      move_x
    end

    if @y + @velocity_y < GameWindow::HEIGHT and @y + @velocity_y > 0
      move_y
    end

    accelerate_left if @KbLeft 
    accelerate_right if @KbRight
  end
end