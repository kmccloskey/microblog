# set up app functionality
require 'sinatra'
require 'sinatra/activerecord'
require './models'
configure(:development){set :database, "sqlite3:blog.sqlite3"}
set :database, "sqlite3:testdata.sqlite3"
set :sessions, true

# functions
current_user = User.find(1)
# def current_user
# 	if session[:user_id]
# 		User.find(session[:user_id])
# 	else
# 		nil
# 	end
# end

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
	@user = current_user
	erb :profile
end

# should contain lists of followers and people followed with options to follow/unfollow
get '/followers' do

end

get '/sign_up' do
	erb :signup
end
get '/sign_in' do
	erb :signin
end
get '/sign_out' do
	erb :signout
end


# -------------------posts----------------------

post '/sign_up' do

	erb :home
end

post '/sign_in' do

	erb :home
end

post '/sign_out' do

	erb :landing
end

post '/settings' do

	erb :settings
end

post '/follow' do

end

post '/edit_settings' do

end

# route for new posts
post '/mumbl' do

end