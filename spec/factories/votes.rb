FactoryGirl.define do
  factory :vote do
    value RandomData.flip_a_coin
    post
    user
  end
end
