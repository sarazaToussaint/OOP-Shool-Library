require_relative './person'

class Teacher < Person
    def initialize(name = 'Unknown', age, parent_permission = 'true', specialization)
        super(age, name, parent_permission: parent_permission)
        @specialization = specialization
    end
    
    def can_use_services?
      true
    end      
end

teacher = Teacher.new(20, 'Geography', 'Mosh')
p teacher.can_use_services?
