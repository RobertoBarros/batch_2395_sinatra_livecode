require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

# Disable Sinatra's Host header check so the app stays reachable when proxied
# through a non-localhost domain
set :host_authorization, { permitted_hosts: [] }

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

post '/restaurants' do
  Restaurant.create!(name: params[:name], city: params[:city])
  redirect "/"
end

get "/hello" do
  erb :hello
end
