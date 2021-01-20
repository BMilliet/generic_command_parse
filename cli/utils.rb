module Utils
  def self.require_command
    Dir["#{__dir__}/command/*.rb"].each { |f| require_relative f }
  end

  def self.require_subcommand class_name
    Dir["#{__dir__}/subcommand/#{class_name.downcase}/*.rb"].each { |f| require_relative f }
  end
end
