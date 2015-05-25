require_relative 'account'

class User

  attr_reader :name

  @@usermap = Hash.new

  def initialize(name)
    @name = name
    @account = account
    @@usermap[name] = self
  end

  def account
    @account ||= Account.new
  end

  def self.lookup_user(name)
    user_name = @@usermap[name]
    raise "Unknown receiver name #{receiver}" if user_name.nil?
    user_name
  end

end