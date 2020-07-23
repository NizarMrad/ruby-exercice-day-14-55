module TicTacToe
  class Board

    attr_reader :grid

    # On pose la grille
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    # On inverse la structure des coordonnées 
    def get_cell(x, y)
      grid[y][x]
    end

    # Méthode pour mettre à jour la valeur de l'objet Cell (dependency)
    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

      # Méthode pour savoir si il y a victoire, égalité, ou partie en cours (false)
    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end
    
    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? " ○ " : cell.value }.join("║")
      end
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    # draw? convertit les cellules en array et check avec Array#non_empty de core_extension.rb pour déterminer une égalité
    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end

    # Pour déterminer un gagnant, on cherche à savoir si il y a 3 cases consécutives non vides avec le même symbole
    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

    # les positions gagnantes
    def winning_positions
      grid + # ligne
      grid.transpose + # colonnes
      diagonals # deux diagonales
    end

    # On indique au programme ce qu'est une diagonale
    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

  end
end
