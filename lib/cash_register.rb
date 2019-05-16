require 'pry'


class CashRegister

    attr_accessor :discount, :total, :title, :quant, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @all_items = []
    end

    def add_item(title, price, quant = 1)
        @total += price * quant
        quant.times do 
            @all_items << title
        end
        @last_transaction = price * quant
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            @total -= (@total * (discount.to_f / 100))
            @total = @total.to_i
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @all_items
    end

    def void_last_transaction
        @total = @total - @last_transaction
    end 


end