FactoryBot.define do
  factory :user, class: User do
    user_name { "User1" }
    email { "test1@mail.com" }
    password { "password" }
    admin { false }
  end
  factory :second_user, class: User do
    user_name { "User2" }
    email { "test2@mail.com" }
    password { "password" }
    admin { false }
  end
  factory :new_user, class: User do
    user_name { "User3" }
    email { "test3@mail.com" }
    password { "password" }
    admin { false }
  end
  factory :admin_user, class: User do
    user_name { "User4" }
    email { "test4@mail.com" }
    password { "password" }
    admin { true }
  end
  factory :show_user, class: User do
    user_name { "User5" }
    email { "test5@mail.com" }
    password { "password" }
    admin { false }
  end
end
