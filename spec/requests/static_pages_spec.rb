require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Ten4Ten" }
  
  describe "Home page" do
  	it "should have the content 'Ten4Ten'" do
  		visit '/static_pages/home'
  		page.should have_content("#{base_title}")
  	end
  	
  	it "should have the title" do
  		visit '/static_pages/home'
  		page.should have_selector('title', :text => "#{base_title}")
  	end
  end
  
  describe "Help page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		page.should have_content('Help')
  	end
  	
  	it "should have the title 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('title', :text => "#{base_title} > Help")
  	end
  end
  
  describe "About page" do
  	it "should have the content 'About'" do
  		visit '/static_pages/about'
  		page.should have_content('About')
  	end
  	
  	it "should have the title 'About'" do
  		visit '/static_pages/about'
  		page.should have_selector('title', :text => "#{base_title} > About")
  	end
  end
  
end
