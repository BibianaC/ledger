require 'ledger'

describe Ledger do

  let(:ledger) { Ledger.new }
  let(:user1) { User.new('John') }
  let(:user2) { User.new('Mary') }
  let(:user3) { User.new('Supermarket') }

  it "should transfer money from one account to another one" do
    ledger.transfer(10, user1.name, user2.name)
    expect(user1.account.balance).to eq -10
    expect(user2.account.balance).to eq 10
  end

  it "should add a transaction" do
    ledger.add_transaction('2015/05/12', 10, user1.name, user2.name)
    ledger.add_transaction('2015/05/12', 50, user2.name, user3.name)
    ledger.add_transaction('2015/05/12', 20, user2.name, user1.name)
    expect(user1.account.balance).to eq 10
    expect(user2.account.balance).to eq -60
    expect(user3.account.balance).to eq 50
  end

  it "should be able to provide a balance for a given date" do
    ledger.add_transaction('2015/05/12', 10, user1.name, user2.name)
    ledger.add_transaction('2015/05/15', 50, user2.name, user1.name)
    expect(ledger.lookup_balance('2015/05/12', 'John')).to eq -10
    expect(ledger.lookup_balance('2015/05/16', 'Mary')).to eq -40
  end
end