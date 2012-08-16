module PetsHelper
  def type_of_pets
    [["Select Pet", ""],["Bird", "bird"], ["Dog", "dog"], ["Cat", "cat"]]
  end
  
  def pets_for_select(pets)
    pets.collect {|p| [ p.name, p.id ]}
  end
end
