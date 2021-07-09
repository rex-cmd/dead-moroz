FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.unique.email }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    birthday              { Faker::Date.between(from: 100.years.ago, to: Time.zone.today) }
    address               { Faker::Address.full_address }
    behavior              { Faker::Lorem.sentence(word_count: 10) }
    password              { Faker::Internet.password(min_length: 6, max_length: 50) }
    password_confirmation { password }
    avatar                { Rack::Test::UploadedFile.new(Rails.root.join('public/placeholder.png'), 'image/jpeg') }
    role                  { 'admin' }

    traits_for_enum(:role)

    trait :no_avatar do
      avatar { nil }
    end
  end
end