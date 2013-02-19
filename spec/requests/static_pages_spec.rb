require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "Should have the content 'Ten4Ten'" do
  		visit '/static_pages/home'
  		page.should have_content('Ten4Ten')
  	end
  end
  
  describe "Help page" do
  	it "Should have the content 'Help'" do
  		visit '/static_pages/help'
  		page.should have_content('Help')
  	end
  end
  
  describe "About page" do
  	it "Should have the content 'About'" do
  		visit '/static_pages/about'
  		page.should have_content('About')
  	end
  end
  
end
