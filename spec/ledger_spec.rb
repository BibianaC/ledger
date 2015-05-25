require 'ledger'

describe Ledger do
  
  it "should have a date" do
    ledger = Ledger.new
    expect(ledger.date).to eq DateTime.now.strftime('%Y/%m/%d')
  end




end