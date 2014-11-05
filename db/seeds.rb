if Rails.env.development?

  u = User.create!(username: 'botfaizal',
    email: 'bot@bot.com',
    password: "1234567890")
  u.add_role(:idonethis)

  (1..10).each do
    user = User.create!(username: Faker::Internet.user_name,
      email: Faker::Internet.email,
      password: "1234567890")
    user.add_role(:duriana)

    (1..5).each do
      task = user.tasks.create!(details: Faker::Lorem.sentence, task_date: Faker::Time.between(2.days.ago, Time.now))
    end
  end
end
