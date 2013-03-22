require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Ten4Ten" }
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
  	it { should have_content("#{base_title}") }
  	it { should have_selector('title', :text => "#{base_title}") }
  end
  
  describe "Help page" do
    before { visit help_path }
  	it { should have_content("Help") }
  	it { should have_selector('title', :text => "#{base_title} > Help") }
  end
  
  describe "About page" do
    before { visit about_path }
  	it { should have_content('About') }
  	it { should have_selector('title', :text => "#{base_title} > About") }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    it { should have_content('Contact') }
  	it { should have_selector('title', :text => "#{base_title} > Contact") }
  end

end
