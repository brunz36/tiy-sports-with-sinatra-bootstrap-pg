require 'sinatra'
require 'pg'
require 'awesome_print'
require 'sinatra/reloader' if development?
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "tiy-sports"
)

require_relative 'team'
require_relative 'player'
require_relative 'membership'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @teams = Team.all

  erb :home
end
