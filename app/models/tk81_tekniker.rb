class Tk81Tekniker < ApplicationRecord
  belongs_to :tk81_pamelding
  self.table_name = 'tk81_teknikere'
  accepts_nested_attributes_for :tk81_pamelding
  belongs_to :forste_valg, class_name: 'Group', foreign_key: '1valg_id'
  belongs_to :andre_valg, class_name: 'Group', optional: true, foreign_key: '2valg_id'
  belongs_to :tredje_valg, class_name: 'Group', optional: true, foreign_key: '3valg_id'
  belongs_to :valgt, class_name: 'Group', optional: true, foreign_key: 'valgt_id'
end
