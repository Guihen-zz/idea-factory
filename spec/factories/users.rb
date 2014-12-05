FactoryGirl.define do

  factory :user do
    username "John Leopold"
    email "jleo@mail.com"
    password "security"
  end

  trait :anonymous do
    username nil
  end

  trait :unreachable do
    email nil
  end

  trait :invalid_email do
    email '@email.invalido'
  end

  trait :no_passwd do
    password nil
  end

end