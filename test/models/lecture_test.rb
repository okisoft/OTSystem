require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  def setup
    @lecture = Lecture.new(name: "software")
  end

  test "有効であること" do
    assert @lecture.valid?
  end

  test "name がなければ無効であること" do
    @lecture.name = ""
    assert_not @lecture.valid?
  end

  test "name が複数あれば無効であること" do
    dup_name = @lecture.dup
    @lecture.save
    assert_not dup_name.valid?
  end

  test "name が長ければ無効であること" do
    @lecture.name = "a" * 33
    assert_not @lecture.valid?
  end
end
