require 'spec_helper'

describe User do
  before do
  	@user = User.new(name: "FakeUser", email: "nobody@nowhere.net", password: "foobar47", password_confirmation: "foobar47")
  end
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_me) }
  it { should respond_to(:album) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "x" * 51 }
    it { should_not be_valid }
  end
  
  describe "email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "email address with mixed case" do
    let(:mixed_case_email) { "Sample@sAmPLE.COM" }
    it "should be saved as all lower case" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end
  
end
