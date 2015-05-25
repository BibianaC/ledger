require 'date'

class Transaction

  attr_reader :date

  def initialize
    @date = DateTime.now.strftime('%Y/%m/%d')
  end

end