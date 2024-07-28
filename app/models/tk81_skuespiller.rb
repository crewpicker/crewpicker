class Tk81Skuespiller < ApplicationRecord
  belongs_to :tk81_pamelding
  self.table_name = 'tk81_skuespillere'
  accepts_nested_attributes_for :tk81_pamelding
  validates :klesstorrelse, presence: true
  validates :skostorrelse, presence: true
  validates :samtykke, presence: true
end
