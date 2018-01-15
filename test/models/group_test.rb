require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = groups(:group)
  end

  test "有効であること" do
    assert @group.valid?
  end

  test "name がなければ無効であること" do
    @group.name = ""
    assert_not @group.valid?
  end

  test "lecture_year_id がなければ無効であること" do
    @group.lecture_year_id = ""
    assert_not @group.valid?
  end


  test "name が長ければ無効であること" do
    @group.name = "a" * 17
    assert_not @group.valid?
  end

  test "name が文字数内であれば有効であること" do
    @group.name = "a" * 16
    assert @group.valid?
  end

  test "lecture_year_id が外部キー制約に違反しているなら無効であること" do
    @group.lecture_year_id = LectureYear.count + 1
    assert_not @group.valid?
  end
end
