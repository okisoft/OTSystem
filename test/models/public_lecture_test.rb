require 'test_helper'

class PublicLectureTest < ActiveSupport::TestCase

  def setup
    @public_lecture = public_lectures(:public_lecture)
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
