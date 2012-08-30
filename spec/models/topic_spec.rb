require 'spec_helper'

describe Topic do
	let(:user) {FactoryGirl.create(:user)}
	before {@topic = user.topics.build(title: "Example title")}
	subject { @topic }

	it {should respond_to :user_id}
	it {should respond_to :title}
	it {should respond_to(:user) }
	its(:user) { should == user }

	it {should be_valid}

	describe "when title is not present" do
		before {@topic.title = " "}
		it { should_not be_valid }
	end

	describe "when title is too long" do
		before {@topic.title = "a"*31}
		it {should_not be_valid }
	end

end
