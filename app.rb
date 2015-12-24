require 'sinatra'
require 'sinatra/activerecord'
require './models'
configure(:development){set :database, "sqlite3:blog.sqlite3"}
set :database, "sqlite3:testdata.sqlite3"
set :sessions, true

get '/' do
	erb :home
end