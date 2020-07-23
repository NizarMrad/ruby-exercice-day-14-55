class Array

  #ré-ouvre l'array et crée la méthode all_empty qui renvoit "true" si tous les éléments d'un array sont vides
  def all_empty?
    self.all? { |element| element.to_s.empty? }
  end

  # retourne true si les 3 éléments d'un array son identiques
  def all_same?
  self.all? { |element| element == self[0] }
  end

  # retourne true si un des éléments de l'array est vide
  def any_empty?
  self.any? { |element| element.to_s.empty? }
  end
  
  # retourne true si aucun des éléments de l'array n'est vide
  def none_empty?
  !any_empty?
end
end
