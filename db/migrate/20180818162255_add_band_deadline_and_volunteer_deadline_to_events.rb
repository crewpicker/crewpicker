class AddBandDeadlineAndVolunteerDeadlineToEvents < ActiveRecord::Migration
  def change
    add_column :events, :band_deadline, :datetime
    add_column :events, :volunteer_deadline, :datetime
  end
end
