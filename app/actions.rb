get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do     # if a user navigates to the path "/signup",
  @user = User.new   # setup empty @user object
  erb(:signup)       # render "app/views/signup.erb"
end

post '/signup' do

  # grab user input values from params
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  # if all user params are present
  if email.present? && avatar_url.present? && username.present? && password.present?

    # instantiate and save a User
    user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    user.save

    # return readable representation of User object
    escape_html user.inspect

  else

    # display simple error message
    "Validation failed."
  end
end