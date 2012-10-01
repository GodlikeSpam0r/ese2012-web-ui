require 'rubygems'
require 'sinatra'
require 'haml'
require 'controllers/main'
require 'controllers/authentication'
require 'models/user'
require 'models/item'

class App < Sinatra::Base

  use Authentication
  use Main

  enable :sessions
  set :show_exceptions, false
  set :public_folder, 'app/public'

  configure :development do
    user = Models::User.named("Hat man")
    user.add_item("Ghastly gibus", 10).active = true
    user.add_item("Big Hat", 15).active = true
    user.add_item("Noh Mercy", 10)
    user.add_item("Prussian Pickelhaube", 10).active  =true

    user2 = Models::User.named("ese")
    user2.add_item("Nyan Cat", 80).active = true
    user2.add_item("Pink Unicorn", 100)
    user2.add_item("Overly attached girlfriend", 0).active=true

    user3 = Models::User.named("Darth Vader")
    user3.add_item("Death star", 10000).active=true
    user3.add_item("Storm trooper", 25)
  end


end

App.run!