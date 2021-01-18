require_relative '../template'

class Build < Template
  attr :desc, :short, :long, :help

  def initialize
    @short = '-b'
    @long = '--build'
    @desc = "Build app"
    @help = 'Build command longer description with examples'
    super
  end

  def run()
    puts 'run the command Build'
  end
end

Build.new
