require 'user'

describe User do
  
  it "should have a name" do
    user = User.new('John')
    expect(user.name).not_to be_empty
  end


end