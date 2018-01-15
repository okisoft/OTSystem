require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  def setup
    @problem = problems(:problem)
  end

  test "有効であること" do
    assert @problem.valid?
  end

  test "lecture_time_id がなければ無効であること" do
    @problem.lecture_time_id = ""
    assert_not @problem.valid?
  end

  test "lecture_time_id 外部キー制約に違反しているなら無効であること" do
    @problem.lecture_time_id = LectureTime.count + 1
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
    @problem.name = "a" * 9
    assert_not @problem.valid?
  end

  test "name が文字数内であれば有効であること" do
    @problem.name = "a" * 8
    assert @problem.valid?
  end

  test "content が長ければ無効であること" do
    @problem.content = "a" * 513
    assert_not @problem.valid?
  end

  test "content が文字数内であれば有効であること" do
    @problem.content = "a" * 512
    assert @problem.valid?
  end
end
