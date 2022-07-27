require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission : true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  def of_age?
    @age >= 18
  end
  private :is_of_age?

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end
  public :can_use_services?
end

# person = Person.new(20, 'Bob')
# p person.can_use_services?
