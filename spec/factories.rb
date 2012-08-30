FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    textColor "red"
		font "Lora"
    password "foobar"
    password_confirmation "foobar"
  end
end

