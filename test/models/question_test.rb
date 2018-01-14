require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    lecture = Lecture.new(name: "software")
    lecture.save
    lecture_year = LectureYear.new(lecture_id: lecture.id, year: 2018, style: "個人")
    lecture_year.save
    lecture_time = LectureTime.new(lecture_year_id: lecture_year.id, time: 1, title: "ソフ工")
    lecture_time.save
    problem = Problem.new(lecture_time_id: lecture_time.id, name: "レビュ表", content: "レビュを書く")
    problem.save
    @question = Question.new(problem_id: problem.id, user_name: "nonaka", group_name: "OTsystem",
                              content: "わからん", reply: "わからんわかる", visible: 1)
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

  test "user_name が長ければ無効であること" do
    @question.user_name = "a" * 17
    assert_not @question.valid?
  end

  test "group_name が長ければ無効であること" do
    @question.group_name = "a" * 17
    assert_not @question.valid?
  end

  test "content が長ければ無効であること" do
    @question.content = "a" * 513
    assert_not @question.valid?
  end

  test "reply が長ければ無効であること" do
    @question.reply = "a" * 513
    assert_not @question.valid?
  end
end
