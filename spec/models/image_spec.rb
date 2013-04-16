require 'spec_helper'

describe Image do
  @user = FactoryGirl.create(:user)
  subject { @user }
  
  describe "can make image" do
    before { @user.album.images.build(name: @user.name + " image", filename: "foobar.jpg") }
    it { should respond_to(:images) }
  end
  
end
