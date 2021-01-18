class Template
  require_relative 'template_register'

  def initialize
    CLI::TemplateRegister.instance.add self
  end
end

