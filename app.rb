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