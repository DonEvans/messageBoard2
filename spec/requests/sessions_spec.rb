require 'spec_helper'

describe "Sessions" do
	
	subject { page }

  describe "Sign in page" do
		before {visit '/signin' }
    it {should have_content("Sign in")}
  end

	describe "with invalid info" do
		before {visit '/signin'
						click_button "Sign in"
						}

		it { should have_content("Sign in") }
		it { should have_content("Sign in failed!") }
	end

	describe "with valid information" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			visit '/signin'
			within ".form" do
			page.fill_in "name", with: user.name
			fill_in "password", with: user.password
			click_button "Sign in"
			end
		end

		it {should have_selector('title', 
																	text:'Message Board | Message Board')}
		it {should have_link('Sign out') }
		it {should_not have_link('Sign in')}
	end

end
