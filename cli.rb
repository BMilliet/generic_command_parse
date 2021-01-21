module CLI
  require 'optparse'
  require 'singleton'
  require_relative 'cli/template_register'
  require_relative 'cli/command_manager'
  require_relative 'cli/template'
  require_relative 'cli/utils'

  autoload :CommandManager,     'cli/command_manager'
  autoload :TemplateRegister,   'cli/template_register'
end
