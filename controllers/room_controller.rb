require_relative 'helper'

require_relative '../models/room'

module RoomController
  def self.run
    run = true
    while run
      Helper.clear_spaces
      puts '------------------------------'
      puts 'Room Menu:'
      puts '(1) Get all room records'
      puts '(2) Find room using id'
      puts '(3) Add new room'
      puts '(9) Back'
      puts '------------------------------'

      print 'Pick option: '
      option = gets.to_i

      case option
      when 1
        fetch_all_rooms
      when 2
        puts '2'
      when 3
        add_room
      when 9
        run = false
        Helper.clear_spaces
      else
        puts 'Invalid option.'
      end
    end
  end

  def self.fetch_all_rooms
    run = true
    while run
      Helper.clear_spaces
      puts '------------------------------'
      rooms = Room.all
      puts 'List of Courses:'
      if rooms.empty?
        puts 'Empty'
      else
        rooms.each do |room|
          puts "(#{room.id}) - #{room.name}"
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

  # Todo: Add find method

  def self.add_room
    run = true
    while run
      Helper.clear_spaces
      puts '------------------------------'
      puts 'Create new room:'
      print 'Name: '
      name = gets

      new_room = Room.new(name)
      room = new_room.save
      unless room.errors.empty?
        room.errors.each do |error|
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
