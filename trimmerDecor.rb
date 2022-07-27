require_relative './decorator'

class TrimmerDecor < Decorator 
  def correct_name
    @nameable.correct_name[0...10]  
  end      
end
    