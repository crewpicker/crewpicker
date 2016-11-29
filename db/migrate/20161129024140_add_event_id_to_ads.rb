class AddEventIdToAds < ActiveRecord::Migration
  def change
    add_reference :ads, :event, index: true, foreign_key: true
    if ads = Ad.where(event_id: nil)
      ads.each do |ad|
        ad.event_id = ActiveEvent.first.id
        ad.save
      end
    end
  end
end
