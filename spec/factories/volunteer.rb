require 'faker'

FactoryGirl.define do
  factory :volunteer do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    birthday { Date.new(1990, 3, 7) }
    email { Faker::Internet.email }
    phone { "81549300" }
    #group { create(:group) }
    #access_level { create(:access_level) }
  end
end
