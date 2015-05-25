require 'account'

describe Account do

  let(:account) { Account.new }
  
  it "should be initialized with 0 balance" do
    expect(account.balance).to eq 0
  end

  it "should be able to be credited" do
    account.credit(10, account.object_id)
    expect(account.balance).to eq 10
  end

  it "should be able to be debited" do
    account.debit(10, account.object_id)
    expect(account.balance).to eq -10
  end

  it "should not have a balance below -100" do
    expect(lambda {account.debit(150, account.object_id)}).to raise_error(RuntimeError, "Your balance cannot be below -100, your current balance is 0")
    expect(account.balance).to eq 0
  end

  it "should have an account number" do
    expect(account.account_num).to eq account.object_id
  end

  it "should have a unique account number" do
    account2 = Account.new
    expect(account.account_num).not_to eq account2.account_num
  end

end