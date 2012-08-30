require 'spec_helper'

describe Message do
	let(:user) {FactoryGirl.create(:user)}
	before {@message = user.messages.build(content: "f adf")}
	subject { @message }

	it {should respond_to :user_id}
	it {should respond_to :content}
	it {should respond_to :topic_id}
	it {should respond_to(:user) }
	it {should respond_to(:topic) }
	its(:user) { should == user }

	it {should be_valid}

	describe "when content is not present" do
		before{@message.content = ""}
		it {should_not be_valid}
	end

  describe "when content is too long" do
		before{@message.content = "z"*1002}
		it {should_not be_valid}
	end

end
