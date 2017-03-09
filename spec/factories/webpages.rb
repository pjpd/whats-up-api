FactoryGirl.define do
  factory :webpage do
    name  { Faker::StarWars.character }
    url   { Faker::Internet.url('example.com') }
    text  { Faker::Lorem.sentence }
    collection_id nil
  end
end
