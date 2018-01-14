require 'test_helper'

class LectureTimeTest < ActiveSupport::TestCase
  def setup
    @lecture_time = lecture_times(:lecture_time)
  end

  test "有効であること" do
    assert @lecture_time.valid?
  end

  test "lecture_year_id がなければ無効であること" do
    @lecture_time.lecture_year_id = ""
    assert_not @lecture_time.valid?
  end

  test "lecture_year_id が外部キー制約に違反しているなら無効であること" do
    @lecture_time.lecture_year_id = LectureYear.count + 1
    assert_not @lecture_time.valid?
  end

  test "time がなければ無効であること" do
    @lecture_time.time = ""
    assert_not @lecture_time.valid?
  end

  test "title が長ければ無効であること" do
    @lecture_time.title = "a" * 257
    assert_not @lecture_time.valid?
  end
end
