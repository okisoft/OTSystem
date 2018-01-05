require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "ログインページを表示すること" do
    get login_path
    assert_response :success
  end

  test "ユーザがログインしている場合はホーム画面を表示すること" do
    assert false
  end

  test "管理者がログインしている場合は管理画面を表示すること" do
    assert false
  end

  test "セッションがない場合はログインページを表示すること" do
    assert false
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
