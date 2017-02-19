require 'active_record'
require 'pathname'
require 'fileutils'

include ActiveRecord::Tasks

class SeedLoader
  def load_seed
    load File.expand_path("../db/seeds.rb", __FILE__)
  end
end

DatabaseTasks.env = ENV['RACK_ENV'] || :development
DatabaseTasks.root = File.dirname(__FILE__)
DatabaseTasks.db_dir = File.expand_path('../db', __FILE__)
DatabaseTasks.database_configuration = YAML.load(File.read('config/database.yml'))
DatabaseTasks.migrations_paths = File.join(DatabaseTasks.db_dir, 'migrate')
DatabaseTasks.seed_loader = SeedLoader.new

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env
end

namespace :db do
  desc 'Generate a migration (parameters: NAME)'
  task :generate_migration do

    name = ENV['NAME']
    raise('No NAME specified. Example usage: `rake db:generate_migration NAME=create_authors`') unless name

    ActiveRecord::Migrator.migrations_paths.each do |directory|
      next unless File.exist?(directory)
      migration_files = Pathname(directory).children
      duplicate = migration_files.find { |path| path.basename.to_s.include?(name) }
      raise("Another migration is already named \"#{name}\": #{duplicate}") if duplicate
    end

    filename = "#{Time.now.utc.strftime('%Y%m%d%H%M%S')}_#{name}.rb"
    dirname = ActiveRecord::Migrator.migrations_path
    path = File.join(dirname, filename)

    FileUtils.mkdir_p(dirname)
    File.write path, <<-MIGRATION.strip_heredoc
      class #{name.camelize} < ActiveRecord::Migration
        def change
        end
      end
    MIGRATION

    puts "Generated Migration: #{path}"
  end
end

load 'active_record/railties/databases.rake'
