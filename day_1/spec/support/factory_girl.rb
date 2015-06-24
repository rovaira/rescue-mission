require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    title "This is a title over and over again. Hopefully this is 40."
    description "I wonder when we'll reach 150 characters. It seems like it might take forever.  Why did we not use a shorter limit?  Okay, fine.  We'll keep writing.  Still writing.  What do you think about Breakable Toys?  Do you know what you're doing?  Yay for being more than half way done!"
  end
end
