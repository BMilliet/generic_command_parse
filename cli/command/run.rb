require_relative '../template'

class Run < Template
  attr :desc, :short, :long, :help

  def initialize
    @short = '-r'
    @long = '--run'
    @desc = "Run app"
    @help = 'Run command longer description with examples'
    super
  end

  def run()
    puts 'run the command Run'
  end
end

Run.new
