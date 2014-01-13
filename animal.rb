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

	def find_client_obj(name) # given name, returns client object
		index = @clients.find_index {|obj| obj.name == name}
		return @clients[index]
	end

	def find_animal_obj(name) # given name, returns animal object
		index = @animals.find_index {|obj| obj.name == name}
		return @animals[index]
	end
end


shelter = Shelter.new()

def menu message
  puts `clear`

  puts "#{message}\n\n" unless message.empty?

  puts "What do you want to do?:"
  puts "1:  display all animals"
  puts "2:  display all clients"
  puts "3:  create an animal"
  puts "4:  create a client"
  puts "5:  facilitate client adopts an animal"
  puts "6:  facilitate clients put animal up for adoption"
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice
  when '1'
  	message = "List of all animals in shelter:\n"
	message += shelter.display_animals + "\n"
  when '2'
  	message = "List of all clients in shelter:\n"
	message += shelter.display_clients + "\n"
  when '3'
  	print "Enter name of animal: " ; name = gets.chomp.capitalize!  
  	print "Enter age: " ; age = gets.chomp.to_i
  	print "Enter gender: " ; gender = gets.chomp.capitalize! 
  	print "Enter species: " ; species = gets.chomp.capitalize! 
  	print "Enter toys (seperated by commas):" ; toylist = gets.chomp
  	toys = toylist.split(',')
  	animal = Animal.new(name, age, gender, species, toys)
  	shelter.animals << animal
  	message += "A new #{species} named #{name} has been added to the shelter."  
  when '4'
  	print "Enter new client name: " ; name = gets.chomp.capitalize! 
  	print "Enter number of children: " ; n_children = gets.chomp.to_i
  	print "Enter age of client: " ; age = gets.chomp.to_i
  	client = Client.new(name, n_children, age)
  	shelter.clients << client
  	message += "A new client named #{name} has been added to the shelter."
  when '5'
  	print "Enter name of client that wishes to adopt: " ; client_name = gets.chomp.capitalize! 
  	print "Enter name of animal #{client_name} wishes to adopt: " ; animal_name = gets.chomp.capitalize! 
 	shelter.facilitate_adoption(client_name, animal_name)
  	message += "#{client_name} has adopted #{animal_name}.\n#{animal_name} has been removed from the shelter."
  when '6'
  	print "Enter name of client: " ; client_name = gets.chomp.capitalize! 
  	print "Enter name of their pet to give up: " ; pet_name = gets.chomp.capitalize! 
  	shelter.facilitate_giving_up(client_name, pet_name)
  	message += "#{client_name} has put #{pet_name} up for adoption.\n#{pet_name} has been added to the shelter."
  else
    message += "I don't understand ..."
  end
  	choice = menu message	
end