module CLI
  class CommandManager
    require 'optparse'
    require_relative 'utils'
    require_relative 'template_register'

    def self.run()
      @main = nil

      command = OptionParser.new do |opt|
        self.header opt
        self.global_flags opt
        opt.on('-h', '--help', "Display help") { puts opt; exit }
        self.command_gen opt
      end

      command.parse ARGV.shift
      @main.run ARGV
    end

    def self.global_flags opt
      opt.separator ''
      opt.separator 'global flags'
      opt.on('-v', '--[no-]verbose', 'Run verbosely') { TemplateRegister.instance.add_global_flag 'verbose' }
      opt.on('-d', '--debug', 'Run in debug mode') { TemplateRegister.instance.add_global_flag 'debug' }
    end

    def self.header opt
      opt.banner = 'Usage: run_command [command] [subcommand]'
      opt.separator ''
    end

    def self.command_gen opt
      Utils.require_command

      opt.separator ''
      opt.separator 'commands'
      TemplateRegister.instance.get_commands.each { |e|
        opt.on(e.short, e.desc) { @main = e }
      }
    end
  end
end
