class Account

  attr_reader :balance, :account_num

  MIN_BALANCE = -100

  def initialize
    @balance = 0
    @account_num = self.object_id
  end

  def credit(amount, account_num)
    @balance =+ amount
  end

  def debit(amount, account_num)
    if (@balance - amount) < MIN_BALANCE
      raise "Your balance cannot be below #{MIN_BALANCE}, your current balance is #{@balance}"
    else
      @balance =- amount
    end
  end

end