require 'test_helper'

class GroupMemberTest < ActiveSupport::TestCase
  def setup
    @group_member = group_members(:group_member)
  end

  test "有効であること" do
    assert @group_member.valid?
  end

  test "user_id がなければ無効であること" do
    @group_member.user_id = ""
    assert_not @group_member.valid?
  end

  test "group_id がなければ無効であること" do
    @group_member.group_id = ""
    assert_not @group_member.valid?
  end

  test "user_id が外部キー制約に違反しているなら無効であること" do
    @group_member.user_id = User.count + 1
    assert_not @group_member.valid?
  end

  test "group_id が外部キー制約に違反しているなら無効であること" do
    @group_member.group_id = Group.count + 1
    assert_not @group_member.valid?
  end

end
