class Animal
	@@n_animals = 0
	attr_reader :name, :age, :gender, :species, :toys
	def initialize(name, age, gender, species, toys=[])
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = toys
		@@n_animals += 1
	end

	def self.get_n_animals()
		@@n_animals
	end
end
