require 'pry'

class Owner
  # code goes here
attr_reader   :species
attr_accessor :name, :pets

  @@all = []

  def initialize(name)
    @name = name
    @pets =  {
      :fishes => [], :dogs => [], :cats => []
    }
    @@all << self

  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def species
    "human"
  end

  def say_species
    "I am a human."
  end

  def name
    @name
  end

  # [:fishes {count = 0}, :dogs {count = 0}]

  def buy_fish(name)
    name = Fish.new(name)
    self.pets[:fishes] << name
  end

  def buy_cat(name)
    name = Cat.new(name)
    self.pets[:cats] << name
  end

  def buy_dog(name)
    name = Dog.new(name)
    self.pets[:dogs] << name
  end

  def walk_dogs
    self.pets[:dogs].map { |dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets[:dogs].map { |dog| dog.mood = "nervous"}
    self.pets[:cats].map {|cat| cat.mood = "nervous"}
    self.pets[:fishes].map {|fish| fish.mood = "nervous"}
    self.pets.clear
  end

# expect(owner.list_pets).to eq("I have 2 fish, 3 dog(s), and 1 cat(s)."
# can iterate through the pets hash, with a conditional.
# or can count each

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

end
