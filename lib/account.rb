class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def credit(amount)
    @balance =+ amount
  end

  def debit(amount)
    if (@balance - amount) < -100
      raise "Your balance cannot be below -100, your current balance is #{@balance}"
    else
      @balance =- amount
    end
  end

end