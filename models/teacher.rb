# frozen_string_literal: true

require_relative 'model'

# Teacher class
class Teacher < Model
  attr_accessor :id, :name, :birth_date, :specialty, :email

  def initialize(name, birth_date, specialty, email)
    super(name)
    @birth_date = birth_date
    @specialty = specialty
    @email = email
  end
end
