require 'haml'
require './models/item'
require './models/user'

class Main  < Sinatra::Application
  before do
     @active_user = Models::User.by_name(session[:name])
  end

  get "/" do
    redirect '/login' unless session[:name]
    haml :index, :locals => {:current_name => session[:name], :items => Models::Item.all }
  end

  get "/user/:name" do
    redirect '/login' unless session[:name]
    user = Models::User.by_name(params[:name])
    haml :user, :locals =>{:user => user}
  end

  get "/buy/:owner/:item" do
    redirect '/login' unless session[:name]
    owner = Models::User.by_name(params[:owner])
    item = Models::Item.by_name(params[:item])
    @active_user.buy(owner, item)

    redirect '/'
  end

  get "/:item/activate" do
    redirect '/login' unless session[:name]
    item = Models::Item.by_name(params[:item])
    item.active = true
    redirect back
  end

  get "/:item/deactivate" do
    redirect '/login' unless session[:name]
    item = Models::Item.by_name(params[:item])
    item.active = false
    redirect back
  end

  get "/additem" do
    redirect '/login' unless session[:name]
     haml :add_item
  end

  post "/additem" do
    redirect '/login' unless session[:name]
    @active_user.add_item(params[:name], params[:price])
    redirect "/additem"
  end

  get "/register" do
    haml :register
  end

  post "/register" do
    Models::User.named(params[:username])
    redirect "/login"
  end

  get "/user" do
    redirect '/login' unless session[:name]
    haml :users, :locals => {:users => Models::User.all}
  end
end