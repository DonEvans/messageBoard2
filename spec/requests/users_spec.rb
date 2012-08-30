require 'spec_helper'

describe "User pages" do

	subject {page}

  describe "User index page" do
		before {visit '/users/index'} 

    it "should have the content 'List of users'" do
			page.should have_content('List of users')
    end

		it "should have the title 'List of users'" do
			page.should have_selector('title', :text => "List of users")
		end

		it "should have link to new user signup" do
			page.should have_link('New user signup')
		end

  end


	describe "New user signup page" do
		before{ visit '/users/new'} 
		
		it "should have the title Signup page" do
			page.should have_selector('title', :text => "Signup Page")
		end

	end

end
