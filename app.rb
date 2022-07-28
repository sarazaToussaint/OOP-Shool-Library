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

# Create a person (teacher or student, not a plain Person)
def create_people
  print 'Do you want to create a student (1) or a teacher (2)? Please select an option: '
  option = gets.chomp
  
  case option
  when '1'
    create_student
  when '2'
    create_teacher
  else
    puts 'Please enter a valid input'
    return
  end
  
  puts 'Person created successfully'
end 

# Create a student
def create_student
  print 'Name: '
  name = gets.chomp
  
  print 'Age: '
  age = gets.chomp

  student = Student.new(name, age)
  @people.push(student)
  puts 'Student added successfully'
end

# Create a teacher
def create_teacher
    print 'Name: '
    name = gets.chomp
    
    print 'Age: '
    age = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp
  
    teacher = Teacher.new(specialization, name, age)
    @people.push(teacher)
    puts 'Teacher added successfully'
  end

# Create book
def create_book
  print 'Title: '
  title = gets.chomp
  
  print 'Author: '
  author = gets.chomp

  book = Book.new(title, author)
  @books.push(book)

  puts 'Book created successfully'
end

# Create rental
def create_rental
  if @books.size.zero?
    puts 'No Books Available'
    elsif @people.size.zero?
      puts 'No Person Available'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Book Title: #{book.title}, Author: #{book.author}" }
      rental_book = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i
      puts 'Enter date in format YYYY-MM-DD'
      date = convert_date(gets)
      rental_detail = Rental.new(@people[rental_person], @books[rental_book], date)
      @rentals.push(rental_detail)
      puts 'Rental Successfully Created'
  end
end

#  List all rentals for a given person id
def list_rentals
  puts 'Select id of any person'
  @people.each { |i| puts "id: #{i.id}, Person: #{i.name}" }
    print 'Person id: '
    person_id = gets.chomp
  @rentals.each do |i|
    puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id.to_i
  end
end
