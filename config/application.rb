require 'config/environment'

# Database connection
db_config = YAML.load(File.read('config/database.yml'))[Application.config.env]
ActiveRecord::Base.default_timezone = :utc
ActiveRecord::Base.establish_connection db_config

# Load application files
[ %w(config initializers ** *.rb),
  %w(app models ** *.rb),
  %w(app lib ** *.rb),
  %w(app api v* *.rb),
  %w(app api *.rb)
].each do |pattern|
  Dir.glob(Application.config.root.join(*pattern)).each { |file| require file }
end
