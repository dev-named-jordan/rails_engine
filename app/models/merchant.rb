class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :items

  def total_revenue
    # require "pry"; binding.pry
    invoice_items
    .where('invoices.status = ?', 'shipped')
    .select('sum(unit_price * quantity)')
  end
end
