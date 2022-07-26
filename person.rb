class Person
  attr_reader: id
  attr_accessor : name, : age

  def initialize(name = 'Unknown', age, parent_permission = 'true')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end
  
  def is_of_age?
    @age >= 18
  end
  private :is_of_age?

  def can_use_services?
    is_of_age? || @parent_permission
  end
  public :can_use_services?
end

# person = Person.new(20, 'Bob')
# p person.can_use_services?