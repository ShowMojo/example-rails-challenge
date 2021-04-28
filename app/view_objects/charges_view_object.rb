class ChargesViewObject < ApplicationViewObject
  def successful_charges
    {
      charges: context[:successful_charges],
      title: 'Successful Charges',
      id: 'successful-charges',
      list_class: ''
    }
  end

  def failed_charges
    {
      charges: context[:failed_charges],
      title: 'Failed Charges',
      id: 'failed-charges',
      list_class: 'charges_block__list_failed'
    }
  end

  def disputed_charges
    {
      charges: context[:disputed_charges],
      title: 'Disputed Charges',
      id: 'disputed-charges',
      list_class: 'charges_block__list_disputed'
    }
  end
end