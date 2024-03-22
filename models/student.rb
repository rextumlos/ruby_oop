# frozen_string_literal: true

require_relative 'model'

# Student class
class Student < Model
  attr_accessor :id, :name, :birth_date, :course_id, :parent

  def initialize(name, birth_date, course_id, parent)
    super(name)
    @birth_date = birth_date
    @course_id = course_id
    @parent = parent

    raise ArgumentError "Course with id of #{course_id} not found." unless Course.find(course_id)
  end
end
