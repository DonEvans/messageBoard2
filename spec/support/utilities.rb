def sign_in(user)
  visit '/signin'
  fill_in "Name",    with: user.name
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

