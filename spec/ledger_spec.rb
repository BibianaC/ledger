require 'ledger'

describe Ledger do

  let(:ledger) { Ledger.new }
  
  it "should have a date" do
    expect(ledger.date).to eq DateTime.now.strftime('%Y/%m/%d')
  end

  it "should transfer money from one account to another one" do
    user1 = User.new('John')
    user2 = User.new('Mary')
    ledger.transfer(10, 'John', 'Mary')
    expect(user1.account.balance).to eq -10
    expect(user2.account.balance).to eq 10
  end

  it "should add a transaction" do
    user1 = User.new('John')
    user2 = User.new('Mary')
    user3 = User.new('Supermarket')
    ledger.add_transaction('2015/05/12', 10, 'John', 'Mary')
    ledger.add_transaction('2015/05/12', 50, 'Mary', 'Supermarket')
    ledger.add_transaction('2015/05/12', 20, 'Mary', 'John')
    expect(user1.account.balance).to eq 10
    expect(user2.account.balance).to eq -60
    expect(user3.account.balance).to eq 50
  end

  it "should be able to provide a balance for a given date" do
    user1 = User.new('John')
    user2 = User.new('Mary')
    ledger.add_transaction('2015/05/12', 10, 'John', 'Mary')
    ledger.add_transaction('2015/05/15', 50, 'Mary', 'John')
    expect(ledger.lookup_balance('2015/05/12', 'John')).to eq -10
    expect(ledger.lookup_balance('2015/05/16', 'Mary')).to eq -40
  end
end