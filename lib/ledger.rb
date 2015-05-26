require 'date'
require_relative 'user'

class Ledger

  attr_reader :date

  def initialize
    @date = DateTime.now.strftime('%Y/%m/%d')
    @history = Hash.new
  end

  def transfer(amount, sender_name, receiver_name)
    sender = User.lookup_user(sender_name)
    receiver = User.lookup_user(receiver_name)
    sender.account.debit(amount)
    receiver.account.credit(amount)
  end

  def add_transaction(date, amount, sender_name, receiver_name)
    transfer(amount, sender_name, receiver_name)
    transaction_date = DateTime.strptime(date, '%Y/%m/%d')
    if @history[sender_name].nil?
      @history[sender_name] = Hash.new
    end
    if @history[receiver_name].nil?
      @history[receiver_name] = Hash.new
    end
    @history[sender_name][transaction_date] = User.lookup_user(sender_name).account.balance
    @history[receiver_name][transaction_date] = User.lookup_user(receiver_name).account.balance
  end

  def lookup_balance(date, principal)
    target_date = DateTime.strptime(date, '%Y/%m/%d')
    if !@history[principal][target_date].nil?
      @history[principal][target_date]
    else
      latest_date = nil
      @history[principal].each do |date, balance|
        if latest_date.nil?
          latest_date = date
        elsif latest_date < date && date < target_date
          latest_date = date
        end
      end
      latest_date.nil? ? 0 : @history[principal][latest_date]   
    end
  end
end