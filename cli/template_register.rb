module CLI
  class TemplateRegister
    require 'singleton'

    include Singleton

    private
    attr_accessor :commands
    attr_accessor :subcommands
    attr_accessor :global_flags

    public
    def initialize
      @commands = []
      @subcommands = []
      @global_flags = []
    end

    def add_command(command)
      @commands << command
    end

    def add_subcommand subcommand
      @subcommands << subcommand
    end

    def add_global_flag flag
      @global_flags << flag
    end

    def get_commands
      @commands
    end

    def get_subcommands
      @subcommands
    end

    def get_global_flag
      @global_flags
    end
  end
end
