require 'test_helper'

class AchievmentTest < ActiveSupport::TestCase
  def setup
    @achievment = achievments(:achievment)
  end

  test "有効であること" do
    assert @achievment.valid?
  end

  test "user_id がなければ無効であること" do
    @achievment.user_id = ""
    assert_not @achievment.valid?
  end

  test "problem_id がなければ無効であること" do
    @achievment.problem_id = ""
    assert_not @achievment.valid?
  end

  test "user_id が外部キー制約に違反しているなら無効であること" do
    @achievment.user_id = User.count + 1
    assert_not @achievment.valid?
  end

  test "problem_id が外部キー制約に違反しているなら無効であること" do
    @achievment.problem_id = Problem.count + 1
    assert_not @achievment.valid?
  end

end
