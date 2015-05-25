class Account

  attr_reader :balance

  MIN_BALANCE = -100

  def initialize
    @balance = 0
  end

  def credit(amount)
    @balance =+ amount
  end

  def debit(amount)
    if (@balance - amount) < MIN_BALANCE
      raise "Your balance cannot be below #{MIN_BALANCE}, your current balance is #{@balance}"
    else
      @balance =- amount
    end
  end

end