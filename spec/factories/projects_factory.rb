FactoryBot.define do
  factory :project do
    title { Faker::Lorem.word }
    goal { Faker::Number.between(1, 500) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'test.jpg'), 'image/jpg') }
    description { Faker::Lorem.paragraph(5) }
  end
end
