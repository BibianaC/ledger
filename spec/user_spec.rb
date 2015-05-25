require 'user'

describe User do

  let(:user) { User.new('John') }
  
  it "should have a name" do
    expect(user.name).not_to be_empty
  end

  it "should have an account" do
    account = Account.new
    expect(user.account).not_to be nil
  end

end