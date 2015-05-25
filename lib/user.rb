require_relative 'account'

class User

  attr_reader :name

  def initialize(name)
    @name = name
    @account = account
  end

  def account
    @account ||= Account.new
  end


end