module CLI
  class TemplateRegister
    require 'singleton'

    include Singleton

    private
    attr_accessor :templates

    public
    def initialize()
      @templates = []
    end

    def add(template)
      @templates << template
    end

    def get_templates()
      @templates
    end
  end
end
