require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  def setup
    lecture = Lecture.new(name: "software")
    lecture.save
    lecture_year = LectureYear.new(lecture_id: lecture.id, year: 2018, style: "個人")
    lecture_year.save
    lecture_time = LectureTime.new(lecture_year_id: lecture_year.id, time: 1, title: "ソフ工")
    lecture_time.save
    @problem = Problem.new(lecture_time_id: lecture_time.id, name: "レビュ表", content: "レビュを書く")
  end

  test "有効であること" do
    assert @problem.valid?
  end

  test "lecture_time_id がなければ無効であること" do
    @problem.lecture_time_id = ""
    assert_not @problem.valid?
  end

  test "name がなければ無効であること" do
    @problem.name = ""
    assert_not @problem.valid?
  end

  test "content がなければ無効であること" do
    @problem.content = ""
    assert_not @problem.valid?
  end

  test "name が長ければ無効であること" do
    @problem.name = "a" * 33
    assert_not @problem.valid?
  end

  test "content が長ければ無効であること" do
    @problem.content = "a" * 513
    assert_not @problem.valid?
  end
end
