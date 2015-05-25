require 'date'
require_relative 'user'

class Ledger

  attr_reader :date

  def initialize
    @date = DateTime.now.strftime('%Y/%m/%d')
  end

  def sender(sender_name)
    sender = User.lookup_user(sender_name)
    if sender.nil?
      raise "Unknown sender name #{sender}"
    end
    sender
  end

  def receiver(receiver_name)
    receiver = User.lookup_user(receiver_name)
    if receiver.nil?
      raise "Unknown receiver name #{receiver}"
    end
    receiver
  end

  def transfer(amount, sender_name, receiver_name)
    sender(sender_name).account.debit(amount)
    receiver(receiver_name).account.credit(amount)
  end
  
end