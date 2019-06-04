FactoryBot.define do
  factory :user do
    name { "Chicharito" }
    email { "aguirregzz97@gmail.com" }
    password { "foobar" }
  end

  factory :micropost do
    content { "content" }
    user_id { 1 }
  end
end