# On crée la classe player qui doit retenir le nom du joueur :name
# et savoir si il joue X ou O :color
module TicTacToe
  class Player
    attr_reader :color, :name
    def initialize(input)
      @color = input.fetch(:color)
      @name = input.fetch(:name)
    end
  end
end
