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
  set :public_folder, 'app/public'

  configure :development do
    user = Models::User.named("Test")
    user.add_item("Item1", 10)
    user.add_item("Item2", 15)
    user.add_item("Item3", 10)

    user.items[0].active = true
    user.items[1].active = true

    user2 = Models::User.named("ese")
    user2.add_item("Item4", 5)
    user2.add_item("Item5", 100)

    user2.items[0].active = true
  end


end

# Now, run it
App.run!