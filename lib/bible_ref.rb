require_relative 'bible_ref/reference'
require_relative 'bible_ref/version'

module BibleRef
  module_function
  def new(*args)
    Reference.new(*args)
  end
end
