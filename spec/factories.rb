FactoryGirl.define do
  factory :user do |f|
  f.sequence(:name) { |n| "anna#{n}" }
  f.sequence(:email) { |n| "anna#{n}@example.com" }
  f.password "anna"
  end
end