require 'date'
require_relative 'user'

class Ledger

  attr_reader :date

  def initialize
    @date = DateTime.now.strftime('%Y/%m/%d')
  end

  def transfer(amount, sender_name, receiver_name)
    sender = User.lookup_user(sender_name)
    receiver = User.lookup_user(receiver_name)
    sender.account.debit(amount)
    receiver.account.credit(amount)
  end

end