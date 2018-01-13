require 'test_helper'

class PublicLectureTest < ActiveSupport::TestCase

  def setup
    user = User.new(user_id: "user", name: "example user", authority: 1,
                     password: "hogehoge", password_confirmation: "hogehoge")
    user.save
    lecture = Lecture.new(name: "software")
    lecture.save
    lecture_year = LectureYear.new(lecture_id: lecture.id, year: 2018, style: "個人")
    lecture_year.save
    lecture_time = LectureTime.new(lecture_year_id: lecture_year.id, time: 1, title: "ソフ工")
    lecture_time.save
    @public_lecture = PublicLecture.new(user_id: user.id, lecture_id: lecture.id, lecture_time_id: lecture_time.id)
  end

  test "有効であること" do
    assert @public_lecture.valid?
  end

  test "user_id が空文字の場合でも有効であること" do
    @public_lecture.user_id = ""
    assert @public_lecture.valid?
  end

  test "lecture_id が空文字の場合でも有効であること" do
    @public_lecture.lecture_id = ""
    assert @public_lecture.valid?
  end

  test "lecture_time_id が空文字の場合でも有効であること" do
    @public_lecture.lecture_time_id = ""
    assert @public_lecture.valid?
  end
end
