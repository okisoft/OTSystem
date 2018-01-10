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
  (1..5).each do |j|
    LectureYear.create(lecture_id: lecture_id, year: 2010 + j, style: 1)\
  end
end

puts "Make LectureTime"
(1..25).each do |i|
  year_id = LectureYear.find(i).id
  (1..5).each do |j|
    LectureTime.create(lecture_year_id: year_id, time: j, title: "タイトル #{j}")
  end
end

puts "Make PublicLecture"
admin = User.create(
  user_id: "admin",
  name: "user admin",
  authority: 1,
  password_digest: User.digest("password")
)
public_lecture = Lecture.last

PublicLecture.create(
  user_id: admin.id,
  lecture_id: public_lecture.id,
  lecture_time_id: public_lecture.lecture_years.last.lecture_times.last.id
)
