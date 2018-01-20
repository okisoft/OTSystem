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

(1..5).each do |i|
  User.create(
    user_id: "user#{i}",
    name: "user name#{i}",
    authority: 3,
    password: "password",
    password_digest: User.digest("password")
  )
end

puts "Make Lecture"
Lecture.create(name: "ソフ工")
Lecture.create(name: "コンパイラ")
Lecture.create(name: "数学")

puts "Make LectureYear"
(1..3).each do |i|
  lecture_ = Lecture.find(i)
  lecture_id = lecture_.id
  3.times do |j|
    LectureYear.new(
      lecture_id: lecture_id,
      year: Date.today.financial_year.to_i - (1 - j),
      style: "個人"
    ).save(validate: false)
  end
end

puts "Make LectureTime"
(1..9).each do |i|
  lecture_year_ = LectureYear.find(i)
  lecture_year_id_ = lecture_year_.id
  lecture_year_year_ = lecture_year_.year
  lecture_name = Lecture.find(lecture_year_.lecture_id).name
  (1..3).each do |j|
    LectureTime.create(
      lecture_year_id: lecture_year_id_,
      time: j,
      title: "#{lecture_year_year_}年度 #{lecture_name} 第#{j}回")
  end
end

puts "Make Problem"
LectureTime.all.each do |lecture_time|
  (1..3).each do |i|
    Problem.create(
      lecture_time_id: lecture_time.id,
      name: "課題 #{i}", content: "内容"
    )
  end
end

puts "Make Question"
admin_ = User.find_by(id: 1, authority: 1)
user1_ = User.find_by(id: 2, authority: 3)
user2_ = User.find_by(id: 3, authority: 3)
user3_ = User.find_by(id: 4, authority: 3)
Problem.all.each do |problem|
  #problem_id_ = Problem.find(i).id
  #user_id_ = User.find_by(authority: 3).id

  # id を集める
  problem_id_ = problem.id
  lecture_time_id_ = problem.lecture_time.id

  problem_name_ = problem.name
  lecture_time_title_ = LectureTime.find(lecture_time_id_).title

  Question.create(
    #problem_id: problem_id_,
    problem_id: problem_id_,
    user_id: user1_.id,# group_name: "",
    content: "[#{lecture_time_title_}, #{problem_name_}]  #{user1_.name}の質問です", reply: " #{admin_.name}の回答です",
    visible: true
  )
  Question.create(
    #problem_id: problem_id_,
    problem_id: problem_id_,
    user_id: user2_.id,# group_name: "",
    content: "[#{lecture_time_title_}, #{problem_name_}]  #{user2_.name}の質問です", reply: " #{admin_.name}の回答です",
    visible: true
  )
  Question.create(
    #problem_id: problem_id_,
    problem_id: problem_id_,
    user_id: user3_.id,# group_name: "",
    content: "[#{lecture_time_title_}, #{problem_name_}]  #{user3_.name}の質問です", reply: " #{admin_.name}の回答です",
    visible: true
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

puts "Make Progress"
user_id = User.find_by(authority: 3).id
lecture_time_id = PublicLecture.first.lecture_time.id
Progress.create(
  lecture_time_id: lecture_time_id,
  user_id: user_id,
  icon: 1
)

puts "Make Achievment"
user_id = User.find_by(authority: 3).id
problem_id = Problem.find(1).id
Achievment.create(
  user_id: user_id,
  problem_id: problem_id
)

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
