require_relative '../template'

class Foo < Command
  attr :desc, :short, :help, :long

  def initialize
    @short = '-foo'
    @desc = "Foo command description"
    @help = 'Foo command longer description with examples'
    super
  end
end

Foo.new
