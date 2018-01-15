require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = questions(:question)
  end

  test "有効であること" do
    assert @question.valid?
  end

  test "content がなければ無効であること" do
    @question.content = ""
    assert_not @question.valid?
  end

  test "visible がなければ無効であること" do
    @question.visible = ""
    assert_not @question.valid?
  end

  test "content が長ければ無効であること" do
    @question.content = "a" * 513
    assert_not @question.valid?
  end

  test "content が文字数内であれば有効であること" do
    @question.content = "a" * 512
    assert @question.valid?
  end

  test "reply が長ければ無効であること" do
    @question.reply = "a" * 513
    assert_not @question.valid?
  end

  test "reply が文字数内であれば有効であること" do
    @question.reply = "a" * 512
    assert @question.valid?
  end
end
