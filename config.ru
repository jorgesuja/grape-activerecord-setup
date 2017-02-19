# Add the current working directory to the load path
$:.unshift File.dirname(__FILE__)

require 'config/application'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run API::Root
