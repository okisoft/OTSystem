# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Make User"
admin = User.create(
  user_id: "admin",
  name: "user admin",
  authority: 1,
  password: "password",
  password_digest: User.digest("password")
)

5.times do |i|
  User.create(
    user_id: "user#{i + 1}",
    name: "user name#{i + 1}",
    authority: 3,
    password: "password",
    password_digest: User.digest("password")
  )
end

puts "Make Lecture"
["ソフ工", "コンパイラ", "数学"].each do |name|
  Lecture.create(name: name)
end

puts "Make LectureYear"
Lecture.all.each do |lecture|
  lecture_id = lecture.id
  nowYear = Date.today.financial_year.to_i
  [nowYear - 2, nowYear - 1, nowYear].each do |year|
    LectureYear.new(
      lecture_id: lecture_id,
      year: year,
      style: "個人"
    ).save(validate: false)
  end
end

puts "Make LectureTime"
LectureYear.all.each do |ly|
  3.times do |i|
    LectureTime.create(
      lecture_year_id: ly.id,
      time: i + 1,
      title: "#{ly.year}年度 #{ly.lecture.name} 第#{i + 1}回"
    )
  end
end

puts "Make Problem"
LectureTime.all.each do |lt|
  3.times do |i|
    Problem.create(
      lecture_time_id: lt.id,
      name: "課題 #{i + 1}", content: "内容"
    )
  end
end

puts "Make Question"
admin = User.find_by(id: 1, authority: 1)
Problem.all.each do |problem|
  User.where(id: 2..4).each do |user|
    Question.create(
      problem_id: problem.id,
      user_id: user.id,
      content: "[#{problem.lecture_time.title}, #{problem.name}] #{user.name}の質問です",
      reply: " #{admin.name}の回答です",
      visible: true
    )
  end
end

puts "Make PublicLecture"
lecture = Lecture.last
PublicLecture.create(
  user_id: admin.id,
  lecture_id: lecture.id,
  lecture_time_id: lecture.lecture_years.last.lecture_times.last.id
)

puts "Make Student"
# user_id = User.find_by(authority: 3).id
# lecture_year_id = PublicLecture.first.lecture_time.lecture_year.id
# Student.create(
#   user_id: user_id,
#   lecture_year_id: lecture_year_id
# )

puts "Make Progress"
lecture_time_id = PublicLecture.first.lecture_time.id
(2..6).each do |i|
  user_id = User.find_by(id: i,authority: 3).id
  Progress.create(
    lecture_time_id: lecture_time_id,
    user_id: user_id,
    icon: 1
  )
end

puts "Make Achievment"
=begin
user_id = User.find_by(authority: 3).id
problem_id = Problem.find(79).id
Achievment.create(
  user_id: user_id,
  problem_id: problem_id

)
problem_id = Problem.find(81).id
Achievment.create(
  user_id: user_id,
  problem_id: problem_id
)
user_id = User.find_by(id: 4,authority: 3).id
problem_id = Problem.find(81).id
Achievment.create(
  user_id: user_id,
  problem_id: problem_id
)
=end

=begin
puts "Group"
(1..5).each do |i|
  lecture__year_id = LectureYear.find(i).id
  Group.create(
    name: "group#{i}",
    lecture_year_id: lecture__year_id
  )
end

puts "GroupMember"
group_id = Group.find(1).id
user_id = User.find_by(authority: 3).id
GroupMember.create(
  group_id: group_id,
  user_id: user_id
)
=end
