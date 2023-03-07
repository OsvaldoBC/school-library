require './person'

# Class student
class Student < Person
  def initialize(name, age, classroom, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student1 = Student.new('Peter', 22, 'Math', parent_permission: false)
puts student1.inspect
puts student1.play_hooky
puts student1.can_use_services?

