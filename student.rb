require_relative './person'

class Student < Person
    def initialize(name = 'Unknown', age, parent_permission = 'true', classroom)
        super(age, name, parent_permission: parent_permission)
        @classroom = classroom
      end
    
    def play_hook
      "¯\(ツ)/¯"
    end      
end
