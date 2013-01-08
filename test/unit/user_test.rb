require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a firstname" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

test "the user should have a unique profile_name" do
	user = User.new
   user.profile_name = users(:jason).profile_name
    
   assert !user.save
   assert !user.errors[:profile_name].empty?
  end

  test "check a user should have a profile_name without spaces" do
    user = User.new(first_name: 'jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'
    
    user.profile_name = "My Profile With Spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do 
    user = User.new(first_name: 'jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.profile_name = 'jasonseifer_1'
    assert user.valid?
  end 

end
