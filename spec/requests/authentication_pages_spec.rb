require 'spec_helper'

describe "Authentication" do
  subject { page }
  
  describe "login page" do
    before { visit login_path }
    
    it { should have_selector('title', text: 'Sign in') }
    
    let(:user) { FactoryGirl.create(:user) }
    it { should_not have_link('Sign out', href: signout_path) }
  end

  describe "login" do
    before { visit login_path }
    
    describe "with invalid information" do
      before { click_button "Sign in" }
      
      it { should have_selector('title', text: "Sign in") }
      it { should have_error_message('Invalid') }
	  describe "after visiting another page" do
		before { click_link "Home" }
		it { should_not have_selector('div.alert.alert-alert') }
	  end
	  
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin user }
      
      it { should have_selector('title', text: user.name) }
      
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: login_path) } 
    end
    
  end
  
  describe "authorization" do
    describe "for non-logged in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      describe "for when attempting to visit a protected page" do
        before do
          visit edit_user_path
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end
        
        describe "after signing in" do
          it "should render the desired protected page" do
            should have_selector('h2', text: "Edit")
          end
        end
        
      end
      
      describe "in the Users controller" do
        describe "visiting the edit page" do
          before { visit edit_user_path }
          it { should have_selector('title', text: 'Sign in') }
        end
        
        describe "submitting to the update action" do
          before { put user_path }
          specify { response.should redirect_to(login_path) }
        end
        
      end
      
    end
    
  end
  
end