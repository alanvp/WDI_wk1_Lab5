class Shelter
	attr_accessor :clients, :animals
	def initialize(clients=[], animals=[])
		@clients = clients
		@animals = animals
	end

	def display_clients
		str = ""
		@clients.each {|person| str += "#{person.name}\n"}
		return str
	end

	def display_animals
		str = ""
		@animals.each {|animal| str += "#{animal.name}\n"}
		return str
	end

	def facilitate_adoption(client_name, animal_name)
  		animal_to_adopt = find_animal_obj(animal_name)
  		find_client_obj(client_name).pets << animal_to_adopt
  		remove_animal(animal_name)
  	end

  	def facilitate_giving_up(client_name, pet_name)
  		client_obj = find_client_obj(client_name)
		index = client_obj.pets.find_index {|obj| obj.name == pet_name}
		@animals << client_obj.pets[index] 
		client_obj.pets.delete_at(index)	
	end

	def remove_animal(name)
		index = @animals.find_index {|obj| obj.name == name}
		@animals.delete_at(index)
	end

	private
	
	def find_client_obj(name) # given name, returns client object
		index = @clients.find_index {|obj| obj.name == name}
		return @clients[index]
	end

	def find_animal_obj(name) # given name, returns animal object
		index = @animals.find_index {|obj| obj.name == name}
		return @animals[index]
	end
end