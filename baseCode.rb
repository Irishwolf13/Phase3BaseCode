# **************************  HELPFUL FUNCTIONS FOR CC  **************************
def self.find_most_frequent_occurance                                 #Finding most frequent item
  newArray = ClassToSearch.all.map{|item| item.forienKey_id}          #Call another Classes.all to map all occurrences of a variable (this case a forgienKey_id) into an array
  newArray.max_by{|i| newArray.count(i)}                              #Takes the array, and finds the most frequent item in the array and returns it
end                                                                   #end of self.find_most_frequent_occurance

def self.average_of_something                                         #Returns all items in a Class (or table)
  all.sum{|item| item.something_to_average}/all.length                #Sums all items in a collumn and averages them
end                                                                   #end Self.average_of_something

def find_by_max_occruance
  self.tableToLookThrough.max_by(&:collumnToLookAt)                   #Max min or lowestest/ highest
end

def self.find_first_or_last
  ClassName.all.order("Collumn To Look At").first #or use .last       #This will use order to put things in order according to the collumn given in the param.
end

self.tables.pluck(:collumn).join(";")                                 #Pluck will pull the item out of the row, join(";") then joins all instances together in one string!
self.tables.where(variable: boolean)                                  #Basic where statement

ClassName.create(item_name: item_name,value: value)                   #Basic create row syntax

# **************************  ACTIVE RECORDS MODELS  **************************
class VarName < ActiveRecord::Base                            #Inherits all the glory that is ActiveRecord::Base
  belongs_to :variable                                        #This goes on a class that has a foreign key on another table
  has_many :variables1                                        #This goes on a Class it's table has a foreign key that is the id of another class
  has_many :variables2, through: :variables1                  #This is a many to many relationship
end                                                           #close of class ClassName

#.max_by(&:variable)                                          #How to search for passed in variable with Pretzel:

# bundle install                                              #Remember to run this first, it will set up the dependencies
# bundle exec rake [commands here]                            #If you have issues with rake, using bundle exec before rake commands might help. [don't type brackets]
# rake -T                                                     #Will give you a list of rake commands available for use

# **************************  ACTIVE RECORDS MIGRATIONS  **************************
# rake db:create_migration NAME=create_var_name               #This command will create a file with proper naming convetions for Active Record in ./db/migrate/

class CreateVarName < ActiveRecord::Migration[6.1]            #Naming convention is PascalCase for ClassName.  Also inherites from ActiveRecord::Migration
  def change                                                  #change is created when file is made.  When created, it will be empty.
    create_table :var_names do |t|                            #Creates table with plural name of class name.  In this case CreateVarName will = :var_names
      t.string :name                                          #Creates column of strings named: name
      t.integer :number                                       #Creates column of integer named: number
    end                                                       #ends create_table
  end                                                         #ends change method
end                                                           #ends CreateVarName

# **************************  SEEDING WITH FAKER  **************************
#gem install faker
#website: https://github.com/faker-ruby/faker
# rake db:seed                                          #Loads the seed data from db/seeds.rb
# rake db:seed:replant                                  #Removes everything from table, and RE-LOADS from db/seeds.rb (fresh start)

puts "Seeding games..."                                 #prints "Seeding games..." to console

50.times do                                             #runs block of code 50 times
  VarName.create(                                       #This name should correspond to Active Records Model
    Var1: Faker::Name.name,                             #Creats fake names using Faker.
    Var2: Faker::Address.address,                       #Creats fake addresses using Faker
    Var3: rand(0..60)                                   #Creats random number between 0 and 60
    Var4: Class.all.sample.id                           #use in Seed.rb get random id from available another Class instance set
  ) #                                                   #end .create()
end # end                                               #end .times do

puts "done!"                                            #prints "done!" to console

# **************************  USING PRY  **************************
require 'pry'                                           #imports pry module, use code on next line to stop code
binding.pry                                             #Stops code where ever this is written, so you can debug


# **************************  OLD CODE  **************************
# **************************  CREATING CLASSES IN RUBY  **************************
class ClassNameHere                                     #Creates a class to be used in ruby code
  @@class_var = []                                      #Creats a CLASS variable and sets it to an empty string

  attr_reader :example1, :example2                      #Creates standard method for read only
  attr_writer :example1, :example2                      #Creates standard method for write only
  attr_accessor :example1, :example2                    #Creates standard method for both read and write

  def initialize(var1, var2="optional")                 #called when .new() is envoked.  This example takes 2 arguments, var2 is optional because value is set to a defult value, in this case a string: "optional".
    @var1 = var1                                        #var1 is passed in when .new(var1) is envoked
    @var2 = var2                                        #var2 is passed in if .new(var1, var2) has two filled arguments.  Otherwise in this case it defaults to "optional"
    @var3 = "A variable"                                #var3 is an instance variable and is set to a string
    @var4 = {name: "Frank", value: 13}                  #var4 is an instance variable and is set to an object with two key/value pairs
    @@class_var << self                                 #Shovels a reference to each instance into the class variable array created on line 8
  end                                                   #close of initializatize

  def custom_reader                                     #Custom reader method, in this case named custom_reader
    @var3                                               #Reads the value of @var3
  end                                                   #close of custom_reader method

  def custom_writer=(value)                             #Creates a custom writer method, in this case named custom_writer
    @var3 = value                                       #Overwrites the value of @var3 with the passed in value
  end                                                   #close of custom_writer method
end                                                     #close of class ClassNameHere