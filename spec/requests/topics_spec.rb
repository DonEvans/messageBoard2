require 'spec_helper'

describe "Topics" do
	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }
	before { visit new_topic_path }

	describe "New topic page" do

		it "should have the content 'Make new Topic'" do
			page.should have_content('Make new Topic')
    end

		it "should have the right title" do
			page.should have_selector('title', :text =>"Make new Topic" )
		end

  end
end
