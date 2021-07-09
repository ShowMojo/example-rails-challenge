module ChargeSeederService
  CURRENCY        = 'USD'.freeze
  CHARGE_STATUSES = {
    successfull: 'paid',
    failed: 'failed',
    disputed: 'disputed'
  }.freeze

  def create_credit_card_charge(customer, status, number)
    number.times do
      create_charge_by_status(customer, status)
    end
  end

  def create_charge_by_status(customer, status)
    case status
    when CHARGE_STATUSES[:successfull]
      create_succeed_charge(customer)
    when CHARGE_STATUSES[:failed]
      create_failed_charge(customer)
    when CHARGE_STATUSES[:disputed]
      create_disputed_charge(customer)
    end
  end

  def create_succeed_charge(customer)
    Charge.create(charge_attributes(customer: customer))
  end

  def create_failed_charge(customer)
    Charge.create(charge_attributes(customer: customer, paid: false))
  end

  def create_disputed_charge(customer)
    Charge.create(charge_attributes(customer: customer, paid: false, disputed: true))
  end

  def charge_attributes(params)
    {
      created: Time.now.to_i,
      paid: true,
      amount: rand(100),
      currency: CURRENCY,
      customer: nil
    }.merge(params)
  end
end
