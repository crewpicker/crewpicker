class CrewMerchandiseOrderLine < ApplicationRecord
  belongs_to :crew_merchandise_order
  belongs_to :merchandise_article_variant
end
