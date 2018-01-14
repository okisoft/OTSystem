require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "セッションがない場合は/loginへリダイレクトすること" do
    sign_in_as 'user'
    delete logout_path
    assert_not is_logged_in?

    # /assignでのリクエスト時
    get root_path
    assert_redirected_to login_path
    # /homeでのリクエスト時
    get home_path
    assert_redirected_to login_path
    # /adminでのリクエスト時
    get admin_path
    assert_redirected_to login_path
  end

  # /assignでのリクエスト時
  test "学生がログインしている場合は/homeへリダイレクトすること" do
    sign_in_as 'user'

    get root_path
    assert_redirected_to home_path
  end

  test "管理者がログインしている場合は/adminへリダイレクトすること" do
    sign_in_as 'admin'

    get root_path
    assert_redirected_to admin_path
  end

  # /homeでのリクエスト時
  test "ユーザがログインしている場合は学生用ホーム画面を表示すること" do
    sign_in_as 'user'

    assert_redirected_to home_path
  end

  test "管理者がログインしている場合は404を表示すること" do
    sign_in_as 'admin'

    get home_path
    assert_response :missing
  end

  test "学生がログインしており開講していない場合は未開講画面を表示すること" do
    public_lecture = public_lectures(:public_lecture)
    public_lecture.lecture_time_id = ""
    public_lecture.save
    sign_in_as 'user'

    get home_path
    assert_response :missing
  end

  test "学生がログインしており開講していて授業を登録していない場合は授業登録画面を表示すること" do
    student = students(:student)
    student.destroy
    sign_in_as 'user'

    get home_path
    assert_redirected_to new_student_path
  end

  test "学生がログインしており授業登録後，授業形態がグループの場合はグループ選択・作成画面を表示すること" do
    skip("@TODO グループの追加")
  end

  test "学生がログインしており授業登録後，授業形態が個人の場合は学生用ホーム画面を表示すること" do
    student = students(:student)
    student.destroy
    sign_in_as 'user'

    get home_path
    post students_path, params: { students: { cerf: "yes" } }
    assert_redirected_to home_path
  end

  # /adminでのリクエスト時
  test "管理者がログインしている場合は管理者用ホーム画面を表示すること" do
    sign_in_as 'admin'

    assert_redirected_to admin_path
  end

  test "学生がログインしている場合は404を表示すること" do
    sign_in_as 'user'

    get admin_path
    assert_response :missing
  end

end
