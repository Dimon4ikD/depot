desc "Создание 3 пользователей с разными правами"
namespace :users do
  task :create=>:environment do
    us1=User.create(email: "admin@god.ru",
      password: "i_am_god",
      role: 2)
    us2=User.create(email: "moderator@angel.ru",
      password: "i_am_angel",
      role: 1)
    us3=User.create(email: "user@kozel.ru",
      password: "i_am_kozel",
      role: 0)
  end
end