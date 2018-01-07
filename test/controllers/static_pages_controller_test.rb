require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "セッションがない場合は/loginへリダイレクトすること" do
    # /assignでのリクエスト時
    assert false
    # /homeでのリクエスト時
    assert false
    # /adminでのリクエスト時
    assert false
  end

  # /assignでのリクエスト時
  test "ユーザがログインしている場合は/homeへリダイレクトすること" do
    assert false
  end

  test "管理者がログインしている場合は/adminへリダイレクトすること" do
    assert false
  end

  # /homeでのリクエスト時
  test "管理者がログインしている場合は404を表示すること" do
    assert false
  end

  test "ユーザがログインしており開講していない場合は未開講画面を表示すること" do
    assert false
  end

  test "ユーザがログインしており開講していて授業を登録していない場合は授業登録画面を表示すること" do
    assert false
  end

  test "授業登録後授業形態がグループの場合はグループ選択・作成画面を表示すること" do
    assert false
  end

  test "授業登録後授業形態が個人の場合は学生用ホーム画面を表示すること" do
    assert false
  end

  # /adminでのリクエスト時
  test "管理者がログインしている場合は管理者用ホーム画面を表示すること" do
    assert false
  end

  test "ユーザがログインしている場合は404を表示すること" do
    assert false
  end

end
