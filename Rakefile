require 'rubygems'
require 'active_record'

begin
  require 'tasks/standalone_migrations'  
  MigratorTasks.new do |t|
    # t.migrations = "db/migrations"
    # t.config = "db/config.yml"
    # t.schema = "db/schema.rb"
    # t.env = "DB"
    # t.default_env = "development"
    # t.verbose = true
    # t.log_level = Logger::ERROR
  end
rescue LoadError => e
  puts "gem install standalone_migrations to get db:migrate:* tasks! (Error: #{e})"
end

task :run do
  
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "db/development.sqlite3")
  
  require 'models/betname.rb'
  require 'models/bookie_game.rb'
  require 'models/bookmaker.rb'
  require 'models/game.rb'
  require 'models/odd.rb'
  require 'models/teamname.rb'
  
  require 'main.rb'
end