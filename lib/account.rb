class Account

  attr_reader :balance, :account_num

  MAX_NEGATIVE_BALANCE = -100

  def initialize
    @balance = 0
  end

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    if (@balance - amount) < MAX_NEGATIVE_BALANCE
      raise "Your balance cannot be below #{MAX_NEGATIVE_BALANCE}, your current balance is #{@balance}"
    else
      @balance -= amount
    end
  end

end