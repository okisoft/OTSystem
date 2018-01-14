require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "ユーザ作成画面を表示すること" do
    get signup_path
    assert_response :success
  end

  test "editのリクエスト時にセッションが無い場合はログインにリダイレクトすること" do
    user = users(:user)
    get edit_user_path(user)
    assert_redirected_to login_url
  end

  test "updateのリクエスト時にセッションが無い場合はログインにリダイレクトすること" do
    user = users(:user)
    patch user_path(user)
    assert_redirected_to login_url
  end

  test "ユーザ作成画面を表示する時，セッションが無い場合は権限レベルを表示しないこと" do
    sign_in_as 'user'
    delete logout_path
    assert_not is_logged_in?

    get signup_path
    assert_select "select", false
  end

  test "ユーザ作成画面を表示する時，管理者でない場合は権限レベルを表示しないこと" do
    sign_in_as 'user'

    get signup_path
    assert_select "select", false
  end

  test "ユーザ作成画面を表示する時，管理者の場合は権限レベルを表示すること" do
    sign_in_as 'admin'

    get signup_path
    assert_select "select", true
  end

  test "ユーザ更新画面を表示する時，管理者でない場合は権限レベルを表示しないこと" do
    user = users(:user)
    sign_in_as 'user'

    get edit_user_path(user)
    assert_select "select", false
  end

  test "ユーザ更新画面を表示する時，管理者の場合は権限レベルを表示すること" do
    admin = users(:admin)
    sign_in_as 'admin'

    get edit_user_path(admin)
    assert_select "select", true
  end

  test "ユーザが作成できること" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { user_id: "Example",
                                         name: "Example User",
                                         password: "password",
                                         password_confirmation: "password" } }
    end
  end

  test "ユーザが作成する場合，権限レベルが学生でしか作成できないこと" do
    sign_in_as 'user'

    post users_path, params: { user: { user_id: "Example User",
                                       name: "Example User",
                                       authority: 1,
                                       password: "password",
                                       password_confirmation: "password" } }
    user = User.find_by(user_id: "Example User")
    assert_not user.admin?
  end

  test "管理者が作成する場合，権限レベルを指定することができること" do
    sign_in_as 'admin'

    post users_path, params: { user: { user_id: "Example Admin",
                                       name: "Example Admin",
                                       authority: 1,
                                       password: "password",
                                       password_confirmation: "password" } }
    user = User.find_by(user_id: "Example Admin")
    assert user.admin?
  end

  test "ユーザが更新する場合，権限レベルが学生でしか更新できないこと" do
    user = users(:user)
    sign_in_as 'user'

    patch user_path(user), params: { user: { user_id: user.user_id,
                                             name: user.name,
                                             authority: 1,
                                             current_password: "password",
                                             password: "password",
                                             password_confirmation: "password" } }
    assert_not user.reload.admin?
  end

  test "管理者が更新する場合，権限レベルを更新することができること" do
    admin = users(:admin)
    sign_in_as 'admin'

    patch user_path(admin), params: { user: { user_id: admin.user_id,
                                              name: admin.name,
                                              authority: 1,
                                              current_password: "password",
                                              password: "password",
                                              password_confirmation: "password" } }
    assert admin.reload.admin?
  end

end
