FactoryBot.define do

  factory :relationship do
    follower
    followed
  end

  factory :user, aliases: [:follower, :followed] do
    name { Faker::Name.name }
    email { "aguirregzz97@gmail.com" }
    password { "foobar" }
  end

  factory :micropost do
    content { "content" }
    user_id { 1 }
  end
end