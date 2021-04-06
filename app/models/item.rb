class Item < ApplicationRecord
  belongs_to :merchant
  # (page:, per_page: 20){ limit(per_page).offset((page - 1) * per_page) }
end
