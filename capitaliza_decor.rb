require_relative './decorator'

class CapitalizeDecor < decorator
  def correct_name
    @nameable.correct_name.capitalize
  end      
end
