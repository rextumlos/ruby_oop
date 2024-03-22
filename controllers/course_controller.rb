# frozen_string_literal: true

require_relative 'helper'

module CourseController
  def self.run
    run = true
    while run
      Helper.clear_spaces
      puts '------------------------------'
      puts 'Courses Menu:'
      puts '(1) Get all course records'
      puts '(2) Find course using id'
      puts '(3) Add new course'
      puts '(9) Back'
      puts '------------------------------'

      print 'Pick option: '
      option = gets.to_i

      case option
      when 1
        fetch_all_courses
      when 2
        fetch_course_by_id
      when 3
        add_course
      when 9
        run = false
        Helper.clear_spaces
      else
        puts 'Invalid option.'
      end
    end
  end

  def self.fetch_all_courses
    run = true
    while run
      Helper.clear_spaces
      puts '------------------------------'
      courses = Course.all
      puts 'List of Courses:'
      if courses.empty?
        puts 'Empty'
      else
        courses.each do |course|
          puts "(#{course.id}) - #{course.name}"
        end
      end
      puts '------------------------------'
      puts '(9) Back'
      puts '------------------------------'

      print 'Pick option: '
      option = gets.to_i
      case option
      when 1
        next
      when 9
        run = false
      else
        puts 'Invalid option.'
      end
    end
  end

  def self.fetch_course_by_id
    run = true
    while run
      Helper.clear_spaces
      puts '------------------------------'
      print 'Enter course id: '
      course_id = gets.to_i

      course = Course.find(course_id)
      if course
        puts "#{course.id} - #{course.name}"
      else
        puts 'Course not found'
      end

      puts '------------------------------'
      puts '(1) Find another one'
      puts '(9) Back'
      puts '------------------------------'

      print 'Pick option: '
      option = gets.to_i
      case option
      when 1
        next
      when 9
        run = false
      else
        puts 'Invalid option.'
      end
    end
  end

  def self.add_course
    run = true
    while run
      Helper.clear_spaces
      puts '------------------------------'
      puts 'Create new course:'
      print 'Name: '
      name = gets

      new_course = Course.new(name)
      course = new_course.save
      unless course.errors.empty?
        course.errors.each do |error|
          puts error
        end
      end

      puts '------------------------------'
      puts '(1) Create another one'
      puts '(9) Back'
      puts '------------------------------'

      print 'Pick option: '
      option = gets.to_i
      case option
      when 1
        next
      when 9
        run = false
      else
        puts 'Invalid option.'
      end
    end
  end
end
