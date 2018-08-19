class AddCommunicationConsentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :communication_consent, :boolean, null: true
  end
end
