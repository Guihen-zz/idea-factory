FactoryGirl.define do
  factory :idea do
    name "Food Sharing"
    # Don't use optional attributes on fixture
    # description  "Get the food that remainds on an food business and distribute it to ONGs."
    # effort 12
    # deadline '25/12/2015'
    trait :unnamed do
      name nil
    end

    factory :invalid_idea, traits: [:unnamed]
  end
end