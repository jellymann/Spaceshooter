require 'gosu'

require_relative 'src/GameStateManager.rb'
require_relative 'src/GameState.rb'
require_relative 'src/ResourceManager.rb'
require_relative 'src/ContentManager.rb'
require_relative 'src/RectangularCollisionModule.rb'

require_relative 'src/Entity.rb'
require_relative 'src/FloatingEntity.rb'
require_relative 'src/SpaceShipFighter.rb'
require_relative 'src/Projectile.rb'
require_relative 'src/Loot.rb'
require_relative 'src/Explosion.rb'

require_relative 'src/gui/GUI.rb'
require_relative 'src/gui/Text.rb'
require_relative 'src/gui/Icon.rb'
require_relative 'src/gui/Button.rb'

require_relative 'src/AIfighter/AIFighter.rb'

require_relative 'src/Player.rb'
require_relative 'src/Background.rb'

require_relative 'src/gamestates/play.rb'

module ZOrder
  GUI_Text = 1505
  GUI_Icon = 1500
  Entity_Default = 1000
  Entity_Secondary = 990
  Background_Cover = 55
  Background_Solid = 50
end

class GameWindow < Gosu::Window
  WIDTH, HEIGHT, FULLSCREEN, NAME = 640, 480, false, "Spaceshooter"

  def initialize
    super WIDTH, HEIGHT, FULLSCREEN
    self.caption = NAME

    @state_manager = GameStateManager.new(self)
    @state_manager.add(Play.new(self))
  end

  def draw
    @state_manager.draw
  end

  def update
    @state_manager.update
  end

  def button_down(id)
    @state_manager.handle_input(id, "down")
  end

  def button_up(id)
    @state_manager.handle_input(id, "up")
  end
end

game = GameWindow.new
game.show
