require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:user)
    @user.password = "password"
  end

  test "有効であること" do
    assert @user.valid?
  end

  test "user_id がなければ無効であること" do
    @user.user_id = ""
    assert_not @user.valid?
  end

  test "name がなければ無効であること" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "authority がなければ無効であること" do
    @user.authority = ""
    assert_not @user.valid?
  end

  test "user_id が長ければ無効であること" do
    @user.user_id = "a" * 33
    assert_not @user.valid?
  end

  test "user_id が文字数内であれば有効であること" do
    @user.user_id = "a" * 32
    assert @user.valid?
  end

  test "name が長ければ無効であること" do
    @user.name = "a" * 17
    assert_not @user.valid?
  end

  test "name が文字数内であれば有効であること" do
    @user.name = "a" * 16
    assert @user.valid?
  end

  test "authority が範囲外であれば無効であること" do
    @user.authority = 4
    assert_not @user.valid?
    @user.authority = 0
    assert_not @user.valid?
  end

  # テスト説明文を修正した by oki
  test "user_id がユニークでないならば無効であること" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "password が空文字であれば無効であること" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password が短ければ無効であること" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "password が長ければ無効であること" do
    @user.password = @user.password_confirmation = "a" * 65
    assert_not @user.valid?
  end

  test "password が6以上の文字数内であれば有効であること" do
    @user.password = @user.password_confirmation = "a" * 6
    assert @user.valid?
  end

  test "password が64以下の文字数内であれば有効であること" do
    @user.password = @user.password_confirmation = "a" * 64
    assert @user.valid?
  end

  test "paswaordとpassword_confirmationが一致してなければ無効であること" do
    @user.password = "a" * 6
    @user.password_confirmation = "b" * 6
    assert_not @user.valid?
  end
end
