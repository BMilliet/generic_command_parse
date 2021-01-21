class Run < SubCommand
  attr :desc, :short, :long, :help

  def initialize
    @short = '-r'
    @long = '--run'
    @desc = "Run command"
    @help = 'Run command longer description with examples'
    super
  end

  def run args
    super
    puts 'run Foo run command'
  end
end

Run.new
