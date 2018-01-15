require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = students(:student)
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
    @student.user_id = users(:admin).id
    assert_not @student.valid?
  end
end
