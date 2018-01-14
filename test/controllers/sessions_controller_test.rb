require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "ログインページを表示すること" do
    get login_path
    assert_response :success
  end

  test "ユーザがログインできること" do
    sign_in_as 'user'
    assert is_logged_in?
  end

  test "ユーザがログアウトできること" do
    sign_in_as 'user'
    delete logout_path
    assert_not is_logged_in?
  end

  test "無効なユーザIDの場合はログインできないこと" do
    post login_path, params: { sessions: { user_id: "",
                                           password: "password" } }
    assert_not is_logged_in?
  end

  test "無効なパスワードの場合はログインできないこと" do
    user = users(:user)
    post login_path, params: { sessions: { user_id: user.user_id,
                                           password: "" } }
    assert_not is_logged_in?
  end
end
