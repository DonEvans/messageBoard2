require 'spec_helper'

describe "Topics pages" do
	

	describe "New topic page" do
		before { visit new_topic_path }

		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }

		it "should redirect to signin page if not signed in" do
			page.should have_content("Sign in")
		end

		it "should have the content 'Make new Topic' if signed in" do
			page.should have_content('Make new Topic')
    end

		it "should have the right title if signed in" do
			page.should have_selector('title', :text =>"Make new Topic" )
		end

  end


	describe "Topic List" do
		before { visit topics_path }
		subject { page }

			it {should have_content('List of Topics')}
		  it {should have_selector('title', :text => "Topics index")}

	end


	describe "Page displaying posts in topic" do
		before { visit topic_path(topic) }

		it "should have the right title" do
			page.should have_selector('title', :text => "Euro crisis news")
		end

	end

end
