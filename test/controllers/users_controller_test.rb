require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "ユーザ作成ページを表示すること" do
    get signup_path
    assert_response :success
  end

  test "ユーザまたはセッションがない場合は権限レベルを表示しないこと" do
    assert false
  end

  test "管理者の場合は権限レベルを表示すること" do
    assert false
  end

  test "ユーザが作成できること" do
    assert false
  end

end
