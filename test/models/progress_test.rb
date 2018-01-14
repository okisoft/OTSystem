require 'test_helper'

class ProgressTest < ActiveSupport::TestCase
  def setup
    @progress = progresses(:progress)
  end

  test "有効であること" do
    assert @progress.valid?
  end

  test "lecture_time_id がなければ無効であること" do
    @progress.lecture_time_id = ""
    assert_not @progress.valid?
  end

  test "lecture_time_id 外部キー制約に違反しているなら無効であること" do
    @progress.lecture_time_id = LectureTime.count + 1
    assert_not @progress.valid?
  end

  test "user_id が空文字の場合でも有効であること" do
    @progress.user_id = ""
    assert @progress.valid?
  end

  test "group_id が空文字の場合でも有効であること" do
    @progress.group_id = ""
    assert @progress.valid?
  end

  test "icon が範囲外であれば無効であること" do
    @progress.icon = 4
    assert_not @progress.valid?
    @progress.icon = 0
    assert_not @progress.valid?
  end

end
