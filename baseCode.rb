require 'pry'                                       #imports pry module, use code on next line to stop code
binding.pry                                         #Stops code where ever this is written, so you can debug

class ClassNameHere                                 #Creates a class to be used in ruby code
    attr_reader :example1, :example2                #Creates standard method for read only
    attr_writer :example1, :example2                #Creates standard method for write only
    attr_accessor :example1, :example2              #Creates standard method for both read and write
    @@class_var = []                                #Creats a CLASS variable and sets it to an empty string

    def initialize(var1, var2="optional")           #called when .new() is envoked.  This example takes 2 arguments, var2 is optional because value is set to a defult value, in this case a string: "optional".
        @var1 = var1                                #var1 is passed in when .new(var1) is envoked
        @var2 = var2                                #var2 is passed in if .new(var1, var2) has two filled arguments.  Otherwise in this case it defaults to "optional"
        @var3 = "A variable"                        #var3 is an instance variable and is set to a string
        @var4 = {name: "John", value: 13}           #var4 is an instance variable and is set to an object with two key/value pairs
        @@class_var << self                         #Shovels a reference to each instance into the class variable array created on line 8
    end                                             #close of initializatize

    def custom_reader                               #Creats a custom reader method, in this case named custom_reader
        @var3                                       #Reads the value of @var3
    end                                             #close of custom_reader method

    def custom_writer=(value)                       #Creates a custom writer method, in this case named custom_writer
        @var3 = value                               #Overwrites the value of @var3 with the passed in value
    end                                             #close of custom_writer method
end                                                 #close of class ClassNameHere