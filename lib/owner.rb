require 'pry'

class Owner
  attr_accessor :name, :pets, :mood
  attr_reader :species

  @@owners = []

  def initialize(species)
    @species = species
    @@owners << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |key, value|
      value.map do |pet| pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    fish_count = @pets[:fishes].length
    dog_count = @pets[:dogs].length
    cat_count = @pets[:cats].length
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end
