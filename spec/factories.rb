FactoryGirl.define do
  factory :band do
    name              'One Direction'
    contact_name      'Niall'
    email             'niall@1d.com'
    phone             '21604040'
    address           'Somewhere'
    postal_code       '1164'
    city              'London Maybe'
    description       'We ar kool'
    song_title        'Beautiful'
    song_composer     'Larry Stylinson'
    song_lyrics       'Na na na na na na na na.'
    playtime_wish     '11:00'
    playtime_wish_alt '12:00'
  end

  factory :user do
    username            'test'
    name                'TTT'
    password            'haxx44'
    password_confirmation 'haxx44'
    email               'test@rockmotrus.no'
    factory :user_with_admin_role do
      after(:create) do |user|
        role = FactoryGirl.create(:role, name: 'admin')
        FactoryGirl.create(:user_role, role_id: role.id, user_id: user.id)
      end
    end
    after(:create) do |user|
      role = FactoryGirl.create(:role)
      FactoryGirl.create(:user_role, role_id: role.id, user_id: user.id)
    end
  end

  factory :role do
    name                'user'
  end

  factory :user_role
end
