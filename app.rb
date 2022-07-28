require_relative './person'
require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'

# create app  class
class App
  initialize
    @rentals = []
    @people = []
    @books = []
  end        
end

# List all books
def list_books
  if @books.empty?
    puts 'No book added in the list yet'
    return
    end
    @books.map do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end      
end

#  List all people
def list_people
  if @people.empty?
    puts "The person's list is empty"
    return
  end
  @people.map do |person|
    puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"        
end
