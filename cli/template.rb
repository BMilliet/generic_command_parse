class Template

  def initialize
    if self.is_a? Command
      CLI::TemplateRegister.instance.add_command self
    elsif self.is_a? SubCommand
      CLI::TemplateRegister.instance.add_subcommand self
    end
  end
end

class SubCommand < Template
  def run args
    (puts self.help; exit) if args.any? { |i| ['-h', '--help'].include? i }
  end
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

    command.parse args.shift
    @main.run args
  end

  def command_gen opt
    Utils.require_subcommand self.class.name
    CLI::TemplateRegister.instance.get_subcommands.each { |e|
      opt.on(e.short, e.long, e.desc) { @main = e }
    }
  end
end
