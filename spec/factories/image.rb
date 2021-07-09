FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('public/placeholder.png'), 'image/png') }
    gift  { association :gift }
  end
end