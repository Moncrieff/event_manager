# Dependencies
require "csv"

# Class definition
class EventManager
  def initialize
    puts "EventManager Initialized."
    filename = "event_attendees.csv"
    @file = CSV.open(filename, {headers: true, header_converters: :symbol})
  end

  def print_names
    @file.each do |line|
      #puts line.inspect
      puts line[:first_name] + " " + line[:last_name]
    end
  end

  def clean_number(original)
      number = original.delete(".").delete("(").delete(")").delete(" ").delete("-")
      if number.length == 10
        # Do nothing
      elsif number.length == 11
        if number.start_with?("1")
          number = number[1..-1]
        else
          number = "0000000000"
        end
      else
        number = "0000000000"
      end
    return number
  end

  def print_numbers
    @file.each do |line|
      number = clean_number(line[:homephone])
      puts number
    end
  end

  def clean_zipcodes(original)
    if original.length < 5
      if original.length == 4
        original = "0" + original
      else
        original = "00" + original
      end
    else
    end
    return original
  end

  def print_zipcodes
    @file.each do |line|
      zipcode = line[:zipcode]
      puts zipcode
    end
  end
end

# Script
manager = EventManager.new
manager.print_zipcodes
