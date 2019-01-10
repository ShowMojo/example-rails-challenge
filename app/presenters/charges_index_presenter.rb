# frozen_string_literals: true

# ChargesIndexPresenter acts like a facade for the view
# abstracting access to internal state. Controllers exposes
# a single variable to views.
class ChargesIndexPresenter
  def failed_charges
    @failed_charges ||= Charge.failed.map { |c| ChargePresenter.new c }
  end

  def disputed_charges
    @disputed_charges ||= Charge.disputed.map { |c| ChargePresenter.new c }
  end

  def successful_charges
    @successful_charges ||= Charge.successful.map { |c| ChargePresenter.new c }
  end
end
