require 'transaction'

describe Transaction do
  
  it "should have a date" do
    transaction = Transaction.new
    expect(transaction.date).to eq DateTime.now.strftime('%Y/%m/%d')
  end


end