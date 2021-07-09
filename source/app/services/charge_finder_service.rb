class ChargeFinderService
  def self.group_charge_by_status
    new.group_charge_by_status
  end

  def group_charge_by_status
    {
      paid: Charge.paid,
      failed: Charge.failed,
      disputed: Charge.disputed
    }
  end
end
