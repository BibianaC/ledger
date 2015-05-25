require 'date'

class Ledger

  attr_reader :date

  def initialize
    @date = DateTime.now.strftime('%Y/%m/%d')
  end

end