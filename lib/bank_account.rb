class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    @@all = []
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(casholla)
        @balance += casholla
    end

    def display_balance
         "Your balance is $#{self.balance}."
    end

    def valid?
        @status == "open" && @balance > 0 
    end

    def close_account
        @status = "closed"
    end
end
