require_relative 'bible_ref/reference'

module BibleRef
  module_function
  def new(*args)
    Reference.new(*args)
  end
end
