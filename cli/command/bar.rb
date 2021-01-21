class Bar < Command
  attr :desc, :short, :help

  def initialize
    @short = '-bar'
    @desc = "Bar command description"
    @help = 'Bar command longer description with examples'
    super
  end
end

Bar.new
