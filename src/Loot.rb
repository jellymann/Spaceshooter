class Loot < FloatingEntity
  attr_accessor :type, :loot_health, :loot_ammo
  def initialize(type, image, x, y, velocity_y, speed)
    super image, x, y, speed
    @type = type
    @velocity_y = velocity_y
    
    if @type == "Health"
      @loot_health = 50
    elsif @type == "Ammo"
      @loot_ammo = 25
    end
  end

  def get_health
    health, @health = @health, 0
    return health
  end

  def get_ammo
    ammo, @ammo = @ammo, 0
    return ammo
  end

  def update
    super
    die if @y > GameWindow::HEIGHT
    move_y
  end

  def on_collide
    die
  end
end