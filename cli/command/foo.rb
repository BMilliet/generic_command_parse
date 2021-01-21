class Foo < Command
  attr :desc, :short, :help

  def initialize
    @short = '-foo'
    @desc = "Foo command description"
    @help = 'Foo command longer description with examples'
    super
  end
end

Foo.new
