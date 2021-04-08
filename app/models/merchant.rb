class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end
end
