module CLI
  class Command
    require 'optparse'
    require_relative 'template_register'

    Dir["#{__dir__}/command/*.rb"].each { |f| require_relative f }

    def self.run()
      args = ARGV
      options = {}
      @main = nil

      command = OptionParser.new do |opt|
        opt.banner = 'Usage: run_command [command]'
        opt.separator ''
        opt.on('-v', '--[no-]verbose', 'Run verbosely') { |c| options[:verbose] = c }
        opt.on('-d', '--debug', 'Run in debug mode') { |c| options[:debug] = c }
        opt.on('-h', '--help', "Display help") { puts opt; exit }
        self.command_gen opt
      end

      command.parse args
      @main.run
    end

    def self.command_gen(opt)
      TemplateRegister.instance.get_templates.each { |e|
        opt.on(e.short, e.long, e.desc) { @main = e }
      }
    end
  end
end
