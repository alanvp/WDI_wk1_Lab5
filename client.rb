class Client 
	@@n_clients = 0
	attr_reader :name, :n_children, :age, :pets, :n_pets
	def initialize(name, n_children, age, pets=[])
		@name = name
		@age = age
		@n_children = n_children
		@pets = pets
		@@n_clients += 1
		@n_pets = pets.length
	end

	def adopt(pet)
		@pets < pet
		@n_pets += 1
	end 

	def give_up(pet_name)
		index = @pets.find_index {|pet| pet.name == pet_name}
		if pets.index = nil 
			puts "#{self.name} doesn't own a pet with this name."
		else
			pets.delete_at(index)
			@n_pets -= 1
		end
	end

	def self.get_n_clients()
		@@n_clients
	end
end