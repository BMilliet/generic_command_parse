require_relative '../template'

class Bar < Command
  attr :desc, :short, :help, :long

  def initialize
    @short = '-bar'
    @desc = "Bar command description"
    @help = 'Bar command longer description with examples'
    super
  end
end

Bar.new
