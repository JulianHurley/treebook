require 'test_helper'

class StatusTest < ActiveSupport::TestCase

  test "that a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end  

  test "that a status' content is at least 2 letters" do
  	status = Status.new
  	status.content = "H"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that a user cannot post without an id" do
  	status = Status.new
  	status.content = "Hal"
  	assert !status.save
  	puts status.errors[:id].inspect
  	assert !status.errors[:id].empty?
  end
end
