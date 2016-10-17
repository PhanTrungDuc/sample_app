User.create!(name: "Phan Trung Duc",
  email: "trungducphan95@gmail.com",
  password: "260895",
  password_confirmation: "260895",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end
