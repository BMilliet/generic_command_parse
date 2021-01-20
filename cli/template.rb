class Template
  require 'optparse'
  require_relative 'template_register'

  def initialize
    if self.is_a? Command
      CLI::TemplateRegister.instance.add_command self
    elsif self.is_a? SubCommand
      CLI::TemplateRegister.instance.add_subcommand self
    end
  end

  def run
    raise NotImplementedError.new 'Must have run implementation'
  end
end

class SubCommand < Template
end

class Command < Template
  def run args
    @main = nil

    command = OptionParser.new do |opt|
      opt.banner = "Usage: run_command -#{self.class.name.downcase} [subcommand]"
      opt.separator ''
      opt.on('-h', '--help', "Display #{self.class.name} help") { puts opt; exit }
      self.command_gen opt
    end

    command.parse args
    @main.run
  end

  def command_gen opt
    Utils.require_subcommand self.class.name
    CLI::TemplateRegister.instance.get_subcommands.each { |e|
      opt.on(e.short, e.long, e.desc) { @main = e }
    }
  end
end
