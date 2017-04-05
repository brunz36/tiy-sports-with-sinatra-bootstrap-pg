require 'sinatra'
require 'pg'
require 'awesome_print'
require 'sinatra/reloader' if development?

require_relative 'active_record_setup'

get '/' do

  erb :home
end
