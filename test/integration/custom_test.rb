require 'test_helper'

class CustomTest < ActionDispatch::IntegrationTest
 test "that /login route opens login page" do 
 	get '/login'
 	assert_response :success
 end

 test "that /logout route opens the logout page" do 
 	get '/logout'
 	assert_response :redirect
 	assert_redirected_to '/'
 end

 test "that /register route opens the register page" do 
 	get '/register'
 	assert_response :success
 end

test "that a profile page works" do 
	get '/jasonseifer'
	assert_response :success
end 

end
