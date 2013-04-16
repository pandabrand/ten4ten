require 'spec_helper'

describe Image do
  before { @user = FactoryGirl.create(:user) }
    
  subject { @user }
    
  describe "can make image" do
    before do
      @user.save
      @user.album.images.create(name: @user.name + " image", filename: "foobar.jpg")
    end
     
    it { should be_valid }
  end
  
end
