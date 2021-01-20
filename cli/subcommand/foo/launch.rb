require_relative '../../template'

class Launch < SubCommand
  attr :desc, :short, :long, :help

  def initialize
    @short = '-l'
    @long = '--launch'
    @desc = "Launch command"
    @help = 'Launch command longer description with examples'
    super
  end

  def run
    puts 'run Foo launch command'
  end
end

Launch.new