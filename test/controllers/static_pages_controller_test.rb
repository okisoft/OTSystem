require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @user = User.new(user_id: "user", name: "example user", authority: 3,
                     password: "hogehoge", password_confirmation: "hogehoge")
    @public_lecture = PublicLecture.new(user_id: nil, lecture_id: nil, lecture_time_id: nil)
    @student = Student.new(user_id: nil, lecture_year_id: nil)
    @lecture_year = LectureYear.new(lecture_id: nil, year: nil, style: nil)
  end

  test "セッションがない場合は/loginへリダイレクトすること" do
    reset_session
    # /assignでのリクエスト時
    get :assign
    assert_redirected_to login_path
    # /homeでのリクエスト時
    get :home
    assert_redirected_to login_path
    # /adminでのリクエスト時
    get :admin
    assert_redirected_to login_path
  end

  # /assignでのリクエスト時
  test "学生がログインしている場合は/homeへリダイレクトすること" do
    get :assign
    @user.authority = 3
    log_in(@user)
    session[:user_id] = @user.id
    assert_redirected_to home_path
  end

  test "管理者がログインしている場合は/adminへリダイレクトすること" do
    @user.authority = 1
    log_in(@user)
    session[:user_id] = @user.id
    assert_redirected_to admin_path
  end

  # /homeでのリクエスト時
  test "管理者がログインしている場合は404を表示すること" do
    get :home
    @user.authority = 1
    log_in(@user)
    session[:user_id] = @user.id
    assert_response　:missing
  end

  test "学生がログインしており開講していない場合は未開講画面を表示すること" do
    @user.authority = 3
    log_in(@user)
    session[:user_id] = @user.id
    assert_template file: '/public/not_open.html'
  end

  test "学生がログインしており開講していて授業を登録していない場合は授業登録画面を表示すること" do
    @user.authority = 3
    log_in(@user)
    session[:user_id] = @user.id
    @public_lecture.lecture_time_id = 1
    assert_template file: わからん
  end

  test "学生がログインしており授業登録後、授業形態がグループの場合はグループ選択・作成画面を表示すること" do
    @user.authority = 3
    log_in(@user)
    session[:user_id] = @user.id
    @public_lecture.lecture_time_id = 1
    @lecture_year.style = "グループ"
    assert_template file: わからん
  end

  test "学生がログインしており授業登録後、授業形態が個人の場合は学生用ホーム画面を表示すること" do
    @user.authority = 3
    log_in(@user)
    session[:user_id] = @user.id
    @public_lecture.lecture_time_id = 1
    @lecture_year.style = "個人"
    assert_template file: わからん
  end

  # /adminでのリクエスト時
  test "管理者がログインしている場合は管理者用ホーム画面を表示すること" do
    get :admin
    @user.authority = 1
    log_in(@user)
    session[:user_id] = @user.id
    assert_template file: わからん
  end

  test "学生がログインしている場合は404を表示すること" do
    @user.authority = 3
    log_in(@user)
    session[:user_id] = @user.id
    assert_response　:missing
  end

end
