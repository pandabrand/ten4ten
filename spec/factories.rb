FactoryGirl.define do
  factory :user do
    sequence (:name) { |n| "Fake User#{n}" }
    sequence (:email) { |n| "nobody_#{n}@nowhere.net" }
    password "foobar47"
    password_confirmation "foobar47"
  end
  
end