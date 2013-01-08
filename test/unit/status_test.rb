require 'test_helper'

class StatusTest < ActiveSupport::TestCase
 test "that a Status requires content" do
  status = Status.new
  assert !status.save
  assert !status.errors[:content].empty?
 end 

 test "that a staus's content is at least 2 letters long" do 
 	status = Status.new
 	status.content ="H"
 	assert !status.save
    assert !status.errors[:content].empty?
 end

test "that a staus has a user id" do 
 	status = Status.new
 	status.content ="Hello"
 	assert !status.save
    assert !status.errors[:user_id].empty?
 end

end
