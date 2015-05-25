require 'account'

describe Account do

  let(:account) { Account.new }
  
  it "should be initialized with 0 balance" do
    expect(account.balance).to eq 0
  end

  it "should be able to be credited" do
    account.credit(10)
    expect(account.balance).to eq 10
  end

  it "should be able to be debited" do
    account.debit(10)
    expect(account.balance).to eq -10
  end

  it "should not have a balance below -100" do
    expect(lambda {account.debit(150)}).to raise_error(RuntimeError, "Your balance cannot be below -100, your current balance is 0")
    expect(account.balance).to eq 0
  end

end