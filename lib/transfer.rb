class Transfer

  attr_reader :sender, :receiver
  attr_accessor :amount, :status
  
@@all = []
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if sender.balance > @amount && valid? && @status == "pending"
      sender.balance -= amount 
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.balance > @amount && valid? && status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end
end
