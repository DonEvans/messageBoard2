require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User", password: "password", 														password_confirmation: "password",
													 textColor: 'red', font: 'Lora')}
	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to (:password) }
	it { should respond_to (:password_confirmation)}
	it { should respond_to(:textColor) }
	it { should respond_to(:font)}

	it { should be_valid }
	describe "when name is not present" do
		before {@user.name = "          "}
		it {should_not be_valid}
	end

	describe "when password is not present" do
		before {@user.password = @user.password_confirmation = "          "}
		it {should_not be_valid}
	end

	describe "when password doesn't match confirmation" do
		before {@user.password_confirmation = "passwor d"}
		it {should_not be_valid}
	end

	describe "when name is too long" do
		before{@user.name = "A"*51 }
		it {should_not be_valid}
	end

	describe "when password is too short" do
		before {@user.password = "gshdk"}
		it {should_not be_valid}
	end

	describe "when password is too long" do
		before {@user.password = "z"*51 }
		it {should_not be_valid}
	end

#Authentication features

	# it {should respond_to(User.authenticate "hgkh", " jhkhg") }
	it {should respond_to(:messages)}

	describe "return value of authenticate method" do
		before {@user.save}
		let(:found_user) {User.find_by_name @user.name}

		describe "with correct password" do
			it {should == User.authenticate(found_user.name, @user.password)}
		end

		describe "with incorrect password" do
			it {should_not == User.authenticate(@user.name, "wrongPass")}
		end

	end


end
