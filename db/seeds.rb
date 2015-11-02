User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "password",
             password_confirmation: "password",
             supervisor: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               supervisor: false)
end

50.times do |n|
  name  = Faker::Lorem.sentence 5
  instruction = Faker::Lorem.sentence 50
  Subject.create(name: name,
                 instruction: instruction)
end

100.times do |n|
  name = Faker::Lorem.sentence 5
  subject = Subject.all[(0..30).to_a.shuffle.first]
  Task.create(name: name,
  						subject: subject)
end

20.times do |n|
  name  = Faker::Lorem.sentence 5
  instruction = Faker::Lorem.sentence 20
  Course.create(name: name,
                 instruction: instruction,
                 start_date: "11/11/2011",
                 end_date: "11/11/2015")
end
19.times do |n|
  n+=1
  CourseSubject.create(course_id: n,
                 subject_id: n)
end
19.times do |n|
  n+=1
  UserSubject.create(user_id: 1,
                 course_subject_id: n,
                 start_date: "11/11/2011",
                 end_date: "11/11/2015")
end
