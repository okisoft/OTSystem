require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    user = User.new(user_id: "user", name: "example user", authority: 1,
                     password: "hogehoge", password_confirmation: "hogehoge")
    user.save
    lecture = Lecture.new(name: "software")
    lecture.save
    lecture_year = LectureYear.new(lecture_id: lecture.id, year: 2018, style: "個人")
    lecture_year.save
    @student = Student.new(user_id: user.id, lecture_year_id: lecture_year.id)
  end

  test "有効であること" do
    assert @student.valid?
  end

  test "user_id がなければ無効であること" do
    @student.user_id = ""
    assert_not @student.valid?
  end

  test "lecture_year_id がなければ無効であること" do
    @student.lecture_year_id = ""
    assert_not @student.valid?
  end

  test "user_id 外部キー制約に違反しているなら無効であること" do
    @student.user_id = User.count + 1
    assert_not @student.valid?
  end

  test "lecture_year_id 外部キー制約に違反しているなら無効であること" do
    @student.lecture_year_id = LectureYear.count + 1
    assert_not @student.valid?
  end

  test "authority に学生以外の権限レベルが入っていれば無効であること" do
    assert false
  end
end
