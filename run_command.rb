require_relative 'cli'

Dir.chdir __dir__

CLI::CommandManager.run
