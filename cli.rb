module CLI
  require_relative 'cli/command'
  require_relative 'cli/template_register'

  autoload :Command,           'cli/command'
  autoload :TemplateRegister,  'cli/template_register'
end
