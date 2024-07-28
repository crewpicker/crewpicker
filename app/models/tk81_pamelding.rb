class Tk81Pamelding < ApplicationRecord
  belongs_to :foresatte_bidrag, class_name: 'Group', optional: true, foreign_key: 'foresatte_bidrag_id'
  has_one :tk81_skuespiller
  has_one :tk81_tekniker
  self.table_name = 'tk81_pameldinger'
  validates :navn, presence: true
  validates :fodselsdato, presence: true
  validates :navn_foresatte, presence: true
  validates :epost_foresatte, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :telefon_foresatte, presence: true
  validates :foresatte_bidrag_id, presence: true
end
