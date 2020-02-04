module FightingGame
  class Overlay

    def initialize(window, player1, player2)
      @player1 = player1
      @player2 = player2
      @window = window
      @healthbar1 = Healthbar.new player1, @window
      @healthbar2 = Healthbar.new player2, @window
      @time = Gosu::milliseconds
    end

    def draw
      @healthbar1.draw
      @healthbar2.draw
      if @player1.health <= 0
        text = Gosu::Image.from_text(@window, "#{@player1.name} Wins!", Gosu.default_font_name, 45)
        text.draw
      elsif @player2.health <= 0
        text = Gosu::Image.from_text(@window, "#{@player2.name} Wins!", Gosu.default_font_name, 45)
        text.draw(377.5,277.5,0)
      end
    end
  end

  private
  class Healthbar
  def initialize player, window
    @player = player
    @window = window
  end

  def draw
    width = @player.health * 3
    return if width <= 0
    x = @player.flip == false ? 20 : @window.width - width - 20
    y = 20
    color = Gosu::Color::YELLOW
    @window.draw_quad(x-5, y-5, Gosu::Color::BLACK, x+5+width, y-5, Gosu::Color::BLACK, x+5+width, 2*y+5, Gosu::Color::BLACK, x-5, 2*y+5, Gosu::Color::BLACK, 1)
    @window.draw_quad(x, y, color, x + width, y, color, x+width, 2*y, color, x, 2*y, color, 1)


  end
end
end
