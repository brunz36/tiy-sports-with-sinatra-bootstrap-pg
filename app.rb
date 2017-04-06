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
require_relative 'game'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  page = (params["page"]).to_i
  offset = (page - 1) * 3

  @teams = Team.all
  @games = Game.all

  erb :home
end
