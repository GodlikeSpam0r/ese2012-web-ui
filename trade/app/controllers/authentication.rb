require 'haml'
class Authentication < Sinatra::Application

  get "/login" do
    haml :login
  end

  post "/login" do
    name = params[:username]
    password = params[:password]

    fail "Empty username or password" if name.nil? or password.nil?

    # Here, authentication succeeds if username==password
    # In a real application, we would of
    # course check the password differently.
    fail "Username or password are not valid" if password != name

    session[:username] = name
    @user = User.by_name(session[:username])
    redirect '/'
  end

  get "/logout" do
    session[:username] = nil
    redirect '/login'
  end

end