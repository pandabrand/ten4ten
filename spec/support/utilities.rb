include ApplicationHelper

def valid_signin(user)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  cookies[:remeber_token] = user.remember_me
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert', text: message)
  end
end