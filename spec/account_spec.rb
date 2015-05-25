require 'account'

describe Account do
  
  it "should be initialized with 0 balance" do
    account = Account.new
    expect(account.balance).to eq 0
  end

end