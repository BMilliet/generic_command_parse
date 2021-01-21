class Build < SubCommand
  attr :desc, :short, :long, :help

  def initialize
    @short = '-b'
    @long = '--build'
    @desc = 'Build command'
    @help = 'Build command longer description with examples'
    super
  end

  def run
    puts 'run Foo build command'
  end
end

Build.new
