# set up app functionality
require 'sinatra'
require 'sinatra/activerecord'
require './models'
configure(:development){set :database, "sqlite3:blog.sqlite3"}
# set :database, "sqlite3:testdata.sqlite3"
set :sessions, true

require 'bundler/setup' 
require 'sinatra/flash'
enable :sessions

def current_user
  if session[:user_id]
    User.find(session[:user_id])  
  else
    nil
  end
end


# functions

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

# Added new_post parameter so it could be used outside of the function.
def mumbl(text_post, new_post)
	even_count=0
	(text_post.each_char).each do |letter|
		if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u" || letter == "A" || letter == "E" || letter == "I" || letter == "O" || letter == "U"
			even_count+=1
			if even_count%2==0
				new_post<<letter
			end
		else
			new_post<<letter
		end
	end
	return new_post
end

# routes

# -------------------gets-----------------------
# Landing page is unaccessable once you click into the site.
get '/' do 
	erb :landing, :layout => :landing_style
end

# homepage with 'feed' and site details
get '/home' do
	current_user
	if current_user.profile == nil
		Profile.create(user_id:current_user.id, bio: "", age: "", location: "")
	end
	erb :home
end

# Profile page should work for self or others
# features include account details, all posts, followers/following counts like on github
get '/profile' do
	current_user
	erb :profile
end
# for OTHER usersfeatures include account details, all posts, followers/following counts like on github
post '/other' do
	# puts params[:clicked_user]
	@clicked_user = User.where(username: params[:clicked_user]).first
	puts @clicked_user.username
	erb :other_profile
end

# should contain lists of followers and people followed with options to follow/unfollow
get '/followers' do
	current_user
	erb :followers
end

post '/sign_up' do
	User.create(params[:user])
	redirect '/'
end


post '/sign_in' do
	@user = User.where(username: params[:username1]).first
	if @user && @user.password == params[:password3]
    	session[:user_id] = @user.id
  	else
	    flash[:alert] = "Are you sure you have the correct username and password?"
    	redirect '/'
	end
  	redirect '/home'
end

post '/sign_out' do
	session[:user_id] = nil
	redirect '/'
end


# -------------------posts----------------------



post '/settings' do

	erb :settings
end

post '/follow' do
	current_user.follow!(User.where(username: params[:clicked_user]).first)
	erb :followers
end

post '/edit_settings' do
	current_user
	current_user.update(fname:params[:fname], lname:params[:lname], email:params[:email])
	current_user.profile.update(bio:params[:bio], age:params[:age], location:params[:location])
	redirect '/profile'
end

post '/delete_current_user' do
	current_user
	current_user.destroy
	redirect '/'
end

# route for new posts
post '/mumbl' do
	# new_post is here so it can be passed into mumbl function and used after.
	new_post = ""
	# passes mumbl into the mumbl function
	mumbl(params[:mumbl], new_post)
	# content of post is changed to mumblfied "new_post".
	Post.create(content:new_post, user_id: current_user.id)
	redirect '/profile'
end