FactoryBot.define do
  factory :message do
    chat_message {Faker::Lorem.sentence}
    chat_image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    group
  end
end