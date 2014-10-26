if Rails.env.development?

  User.create!(username: 'botfaizal',
    email: 'bot@bot.com',
    password: "1234567890")

  (1..10).each do
    user = User.create!(username: Faker::Internet.user_name,
      email: Faker::Internet.email,
      password: "1234567890")

    (1..5).each do
      task = user.tasks.create!(details: Faker::Lorem.sentence)
      task.created_at = Faker::Time.between(2.days.ago, Time.now)
	  task.save
    end
  end
end




