require_relative './nameable'
require_relative('./rental')

class Person < Nameable
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  def initialize(age, name = 'Unkown', parent_permission = 'true')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def of_age?
    @age >= 18
  end
  # private : of_age?

  def correct_name
    @name
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  # def add_rental(rental)
  #   @rentals.push(rental)
  # end

  def can_use_services?
    of_age? || @parent_permission
  end
  public :can_use_services?
  private :of_age?
end
