require 'test_helper'

class UserTest < ActiveSupport::TestCase

	user = User.new
	user2 = User.new
	user3 = User.new
	user4 = User.new

	emptyarray = []

	test "user can enter a first name"  do
		assert ! user.save
		assert ! user.errors[:first_name].empty?
 	end

 	test "user can enter a last name" do
 		assert ! user.errors[:last_name].empty?
 	end	

 	test "user can enter a profile name" do
 		assert ! user.errors[:last_name].empty?
 	end	

 	test "a user should have a unique profile name" do
 		user.profile_name = users(:julian).profile_name
 	
 		assert !user.save

 		assert !user.errors[:profile_name].empty?
  	
  		user2.profile_name = users(:rob).profile_name		
 	
 		assert !user2.save

 		assert !user2.errors[:profile_name].empty?
 	end

 	test "that profile name with spaces cannot be saved" do
 		x = User.new
 		x.profile_name = "Ha Name"
 		assert !x.save 

 		puts " \n\n ######### ERROR REPORT 2 START ######### \n\n "
 		puts x.errors[:profile_name].inspect
 		puts " \n\n ######### ERROR REPORT 2 END ######### \n\n "

 		#assert user3.errors[:profile_name].include?("Must be formatted correctly.")
	end

 	test "that profile name with numbers cannot be saved" do
 		x = User.new
 		x.profile_name = "aright_12"
 		assert !x.save 

 		puts " \n\n ######### ERROR REPORT 3 START ######### \n\n "
 		puts x.errors[:profile_name].inspect
 		puts " \n\n ######### ERROR REPORT 3 END ######### \n\n "

 		#assert user3.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "that profile name with symbols cannot be saved" do
 		x = User.new
 		x.profile_name = "hello@hello"
 		assert !x.save 

 		puts " \n\n ######### ERROR REPORT 3 START ######### \n\n "
 		puts x.errors[:profile_name].inspect
 		puts " \n\n ######### ERROR REPORT 3 END ######### \n\n "

 		#assert user3.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "that profile name with under scores CAN be saved" do
 		x = User.new
 		x.profile_name = "hellh876"
 		assert x.save 

 		puts " \n\n ######### ERROR REPORT 3 START ######### \n\n "
 		puts x.errors[:profile_name].inspect
 		puts " \n\n ######### ERROR REPORT 3 END ######### \n\n "

 		#assert user3.errors[:profile_name].include?("Must be formatted correctly.")
	end
end

