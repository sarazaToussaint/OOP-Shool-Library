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
    