class ChargeRepo < ApplicationRepo
  CHARGE_STATUSES = {
    successful: { paid: true, refunded: false },
    failed: { paid: false, refunded: true },
    disputed: { paid: false, refunded: false }
  }.freeze

  attr_reader :customer_model

  def initialize(model:, customer_model: nil)
    @customer_model = customer_model
    super(model: model)
  end

  def create!(customer_id:, amount:, created:, status:)
    record = build_default(customer_id: customer_id, amount: amount, created: created)
    record.assign_attributes(CHARGE_STATUSES[status])
    record.save!
  end

  def all_by_status(status)
    model.includes(customer_name).where(CHARGE_STATUSES[status]).references(customer_name).all
  end

  private

  def customer_name
    @_customer_name ||= customer_model.name.downcase
  end

  def build_default(customer_id:, amount:, created:)
    model.new(
      paid: true,
      currency: Charge::USD_CURRENCY,
      refunded: false,
      customer_id: customer_id,
      amount: amount,
      created: created
    )
  end
end