FactoryBot.define do
  factory :photo do
    sequence(:image) { |n| "https://some.image/url#{n}.jpeg" }
    sequence(:caption) { |n| "Some caption #{n}" }
  end

  factory :user do
    sequence(:username) { |n| "Person ##{n}" }
  end

  factory :like do
    sequence(:fan_id) { |n| n} }
    sequence(:photo_id) { |n| n} }
  end

  factory :comment do
    sequence(:author_id) { |n| n} }
    sequence(:photo_id) { |n| n} }
    sequence(:body) { |n| 
      "What a nice photo! My favorite number is also #{n}"
     }
  end
end