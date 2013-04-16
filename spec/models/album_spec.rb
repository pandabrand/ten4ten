require 'spec_helper'

describe Album do
  before do 
    @user = FactoryGirl.create(:user)
  end
  
  subject { @user }
  
  describe "album creation" do
    it { should respond_to(:album) } 
  end
    
  describe "an album can only have 10 images" do
    before do
      11.times do |x|
        @user.album.images.build(name: @user.name + "#{x} image", filename: "foobar#{x}.jpg")
      end
      @user.save
    end
    
    it { should be_invalid }
  end
end
