module ChargesHelper
    def successful_charges
        Charge.where(paid: true, refunded: false)
    end
    
    def failed_charges
        Charge.where(paid: false)
    end

    def disputed_charges
        Charge.where(paid: false, refunded: true)
    end
end
