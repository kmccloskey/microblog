# set up app functionality
require 'sinatra'
require 'sinatra/activerecord'
require './models'
configure(:development){set :database, "sqlite3:blog.sqlite3"}
set :database, "sqlite3:testdata.sqlite3"
set :sessions, true

# functions

def mumbl(text_post)
	even_count=0
	new_post=""
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
	erb :landing
end	


# homepage with 'feed' and site details
get '/home' do
	erb :home
end

# Profile page should work for self or others
# features include account details, all posts, followers/following counts like on github
get '/profile' do

end

# should contain lists of followers and people followed with options to follow/unfollow
get '/followers' do

end

post '/sign_up' do
	User.create(params[:user])
	redirect '/home'
end

post '/sign_in' do
	erb :signin
	@user = User.where(username: params[:username]).first
	if @user && @user.password == params[:password]
    	flash[:notice] = "You've been signed in successfully."
    	session[:user_id] = @user.id
  	else
	    flash[:alert] = "There was a problem signing you in."
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

end

# route for new posts
post '/mumbl' do

end