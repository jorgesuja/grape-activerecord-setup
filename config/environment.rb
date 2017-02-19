# Detect environment
env = (ENV['RACK_ENV'] || :development)

# Load dependencies
require 'bundler'
Bundler.require :default, env.to_sym

# App config
module Application
  include ActiveSupport::Configurable
end

Application.configure do |config|
  config.root = Pathname.new(File.expand_path('../..', __FILE__))
  config.env = ActiveSupport::StringInquirer.new(env.to_s)
end
