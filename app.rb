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
