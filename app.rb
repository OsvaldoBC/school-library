require './student'
require './teacher'

# class app
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def selectoption(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_by_person_id
    else
      puts 'That is not a valid option'
    end
  end

  def run
    option=-1
    until option == 7
      menu
      option = gets.chomp.to_i
      selectoption(option) unless option == 7
    end
    puts 'Thank you for using this app'
  end

  def menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i

    case option
    when 1
      person = create_student
    when 2
      person = create_teacher
    else
      puts 'That is not a valid input'
      return
    end

    @people.push(person)
    puts 'Person created successfully'
    puts ''
    run
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'
    person = Student.new(name, age, '', parent_permission: permission)
    @people.push(person)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(name, age, specialization)
    @people.push(person)
  end

# def create_book
def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  @books.push(book)
  puts 'Book created successfully'
  run
end

  private :create_student, :create_teacher

end
