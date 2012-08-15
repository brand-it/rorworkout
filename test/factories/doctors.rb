# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor do
    name "Jim John"
    address "1234 NoWere Ave"
    city    "Moon"
    state   "Mare Nubium"
    zip     "12903"
    years_of_experience "1"
    created_by {|a| a.association(:user)}
  end
end
