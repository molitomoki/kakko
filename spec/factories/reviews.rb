FactoryBot.define do
  factory :review do
    total                   { 3 }
    concept                 { 3 }
    quality                 { 3 }
    usability               { 3 }
    utility                 { 3 }
    text                    { Faker::Lorem.sentence }

    association :user
    association :post
  end
end
