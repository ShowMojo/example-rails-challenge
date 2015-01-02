class Charge < ActiveRecord::Base
  belongs_to :customer

  def self.grouped_by_states
    all.group_by do |charge|
      if !charge.paid and !charge.refunded
        'disputed'
      elsif charge.paid and !charge.refunded
        'succeed'
      elsif !charge.paid and charge.refunded
        'failed'
      end
    end
  end
end
