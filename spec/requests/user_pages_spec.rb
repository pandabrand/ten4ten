require 'spec_helper'

describe "User pages" do

  let(:base_title) { "Ten4Ten" }
  subject { page }
	
  describe "signup page" do
    before { visit signup_path }
    it { should have_content('Sign up') }
  	it { should have_selector('title', :text => "#{base_title} > Sign up") }
  end
end