# Read about factories at https://github.com/thoughtbot/factory_girl

default_password = "password"
FactoryGirl.define do
  factory :user do
    first_name            "John"
    last_name             "Doe"
    
    sequence :email do |n|
      "johndoe#{n}@gmail.com"
    end
    
    password              default_password
    password_confirmation default_password
    confirmed             true
    approved              true
    
    
    
    trait :active do
      active true
    end
    
    trait :deactive do
      active false
    end
    
    trait :user do
      access_level 0
    end
    
    trait :admin do
      access_level 8
    end
    
    factory :active_user, traits: [:active, :user]
    
    factory :active_admin, traits: [:active, :admin]
  end
end