module Charges
  class ChargeQuery
    attr_reader :relation

    def initialize(relation = Charge.includes(:customer))
      @relation = relation
    end

    def failed
      relation.where(paid: false)
    end

    def disputed
      relation.where(paid: true, refunded: true)
    end

    def successful
      relation.where(paid: true, refunded: false)
    end
  end
end
