require_relative '../template'

class Launch < Template
  attr :desc, :short, :long, :help

  def initialize
    @short = '-l'
    @long = '--launch'
    @desc = "Launch app on simulator"
    @help = 'Launch command longer description with examples'
    super
  end

  def run()
    puts 'run the command Launch'
  end
end

Launch.new
