require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "ログインページを表示すること" do
    get login_path
    assert_response :success
  end

  test "ユーザがログインできること" do
    assert false
  end

  test "ユーザがログアウトできること" do
    assert false
  end

  test "無効なユーザIDの場合はログインできないこと" do
    assert false
  end

  test "無効なパスワードの場合はログインできないこと" do
    assert false
  end

end
