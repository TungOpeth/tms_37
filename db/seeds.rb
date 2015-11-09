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

5.times do |n|
  name = Faker::Lorem.sentence 5
  Subject.all.each do |s|
    s.tasks.create(name: name)
  end
end

20.times do |n|
  name  = Faker::Lorem.sentence 5
  instruction = Faker::Lorem.sentence 20
  Course.create(name: name,
                 instruction: instruction,
                 status: "Not Started",
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
 UserTask.create(user_id: 1,
                  task_id: 1,
                  course_subject_id: 1,
                  user_subject_id: 1,
                  status: "Activate")

 UserTask.create(user_id: 1,
                  task_id: 51,
                  course_subject_id: 1,
                  user_subject_id: 1,
                  status: "Activate")
  UserTask.create(user_id: 1,
                  task_id: 101,
                  course_subject_id: 1,
                  user_subject_id: 1,
                  status: "Activate")
   UserTask.create(user_id: 1,
                  task_id: 151,
                  course_subject_id: 1,
                  user_subject_id: 1,
                  status: "Activate")
    UserTask.create(user_id: 1,
                  task_id: 201,
                  course_subject_id: 1,
                  user_subject_id: 1,
                  status: "Activate")
