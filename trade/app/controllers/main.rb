require 'haml'
require './models/item'
require './models/user'

class Main  < Sinatra::Application
    get "/" do
    #redirect '/login' unless session[:username]
    haml :index, :locals => {:current_name => session[:name], :items => Models::Item.all }
  end

  get "/user/:name" do
    user = Models::User.by_name(params[:name])
    haml :user, :locals =>{:user => user}
  end

  get "/buy/:owner/:item" do
    owner = Module::User.by_name(params[:owner])
    item = Module::Item.by_name(params[:item])
    user.buy(owner, item)
    redirect '/'
  end
end