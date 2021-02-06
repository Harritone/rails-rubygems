# User.create!(email: 'sampae@mail.com', password: 'password', password_confirmation: 'password')
user = User.new(
  email: 'sample@mail.com',
  password: 'password',
  password_confirmation: 'password'
)
user.skip_confirmation!
user.save!

30.times do
  Course.create([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user_id: User.first.id,
    short_description: Faker::Quote.famous_last_words,
    language: Faker::ProgrammingLanguage.name,
    level: 'Beginner',
    price: Faker::Number.between(from: 100, to: 10000)
  }])
end