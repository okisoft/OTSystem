require 'test_helper'

class LectureYearTest < ActiveSupport::TestCase
  def setup
    @lecture_year = lecture_years(:lecture_year)
  end

  test "有効であること" do
    assert @lecture_year.valid?
  end

  test "lecture_id がなければ無効であること" do
    @lecture_year.lecture_id = ""
    assert_not @lecture_year.valid?
  end

  test "lecture_id 外部キー制約に違反しているなら無効であること" do
    @lecture_year.lecture_id = Lecture.count + 1
    assert_not @lecture_year.valid?
  end

  test "year がなければ無効であること" do
    @lecture_year.year = ""
    assert_not @lecture_year.valid?
  end

  test "style がなければ無効であること" do
    @lecture_year.style = ""
    assert_not @lecture_year.valid?
  end

  test "style が「個人」か「グループ」でなければ無効であること" do
    @lecture_year.style = "a" * 5
    assert_not @lecture_year.valid?
  end
end
