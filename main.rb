# frozen_string_literal: true

require_relative 'models/course'
require_relative 'models/room'
require_relative 'models/student'
require_relative 'models/subject'
require_relative 'models/teacher'

require_relative 'controllers/course_controller'
require_relative 'controllers/room_controller'

def main_menu
  run = true
  while run
    Helper.clear_spaces
    puts '------------------------------'
    puts 'Welcome to Enrollment OOP'
    puts 'Main Menu:'
    puts '(1) Open Courses'
    puts '(2) Open Rooms'
    puts '(3) Open Students'
    puts '(4) Open Subjects'
    puts '(5) Open Teachers'
    puts '(6) Open Subject Students'
    puts '(9) Quit'
    puts '------------------------------'

    print 'Pick option: '
    option = gets.to_i

    case option
    when 1
      CourseController.run
    when 2
      RoomController.run
    when 3
      puts 'Add controller for this'
    when 4
      puts 'Add controller for this'
    when 5
      puts 'Add controller for this'
    when 6
      puts 'Add controller for this'
    when 9
      run = false
      Helper.clear_spaces
    else
      puts 'Invalid option.'
    end
  end

end

main_menu
