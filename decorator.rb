require './nameable'

# class decorator
class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    super()
    @nameable.correct_name
  end
end
