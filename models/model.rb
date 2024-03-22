# frozen_string_literal: true

# Model class
class Model
  attr_accessor :id, :name, :errors

  @@records = {}

  def initialize(name = '')
    @id = increment_id
    @name = name.strip
    @errors = []
  end

  def self.all
    records_for_class.sort_by!(&:id)
  end

  def self.find(id)
    all.detect { |record| record.id == id }
  end

  def self.create(name)
    instance = new(name)
    return instance.errors unless instance.validate_self?

    records_for_class << instance
    instance
  end

  def save
    return self unless validate_self?

    self.class.records_for_class << self
    self
  end

  def increment_id
    self.class.records_for_class.length + 1
  end

  def validate_self?
    @errors << 'Name is empty' if @name.nil? || @name.empty?

    @errors.empty?
  end

  def self.records_for_class
    @@records[self] ||= []
  end
end
