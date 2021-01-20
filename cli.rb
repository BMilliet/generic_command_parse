module CLI
  require_relative 'cli/command_manager'
  require_relative 'cli/template_register'

  autoload :CommandManager,     'cli/command_manager'
  autoload :TemplateRegister,   'cli/template_register'
end
