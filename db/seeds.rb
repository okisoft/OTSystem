# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Make Lecture"
(1..5).each do |i|
  Lecture.create(name: "授業 #{i}")
end

puts "Make LectureYear"
(1..5).each do |i|
  lecture_id = Lecture.find(i).id
  5.times do |j|
    LectureYear.new(
      lecture_id: lecture_id,
      year: Date.today.financial_year.to_i - j,
      style: "個人"
    ).save(validate: false)
  end
end

puts "Make LectureTime"
(1..25).each do |i|
  year_id = LectureYear.find(i).id
  (1..5).each do |j|
    LectureTime.create(lecture_year_id: year_id, time: j, title: "タイトル #{j}")
  end
end

puts "Make Problem"
LectureTime.all.each do |lecture_year|
  (1..5).each do |j|
    Problem.create(
      lecture_time_id: lecture_year.id,
      name: "課題 #{j}", content: "内容"
    )
  end
end

puts "Make Question"
Problem.all.each do |problem|
  (1..5).each do |j|
    Question.create(
      problem_id: problem.id,
      user_name: "user#{j}", group_name: "",
      content: "質問です", reply: "回答です",
      visible: true
    )
  end
end

puts "Make User"
admin = User.create(
  user_id: "admin",
  name: "user admin",
  authority: 1,
  password: "password",
  password_digest: User.digest("password")
)

(1..5).each do |i|
  User.create(
    user_id: "user#{i}",
    name: "user name#{i}",
    authority: 3,
    password: "password",
    password_digest: User.digest("password")
  )
end

puts "Make PublicLecture"
public_lecture = Lecture.last
PublicLecture.create(
  user_id: admin.id,
  lecture_id: public_lecture.id,
  lecture_time_id: public_lecture.lecture_years.last.lecture_times.last.id
)

puts "Make Student"
user_id = User.find_by(authority: 3).id
lecture_year_id = PublicLecture.first.lecture_time.lecture_year.id
Student.create(
  user_id: user_id,
  lecture_year_id: lecture_year_id
)

=begin
puts "Make Progress"
user_id = User.find_by(authority: 3).id
lecture__year_id = PublicLecture.first.lecture_time.lecture_year.id
Progress.create(
  lecture_year_id: lecture__year_id,
  user_id: user_id,
  group_id: group_id,
  icon: 1
)

puts "Achievment"
progess_id = Progess.find(1).id
problem_id = Problem.find(1).id
Achievment.create(
  user_id: progess_id
  group_id: progess_id
  problem: problem_id
)

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
