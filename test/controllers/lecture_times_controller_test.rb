require 'test_helper'

class LectureTimesControllerTest < ActionDispatch::IntegrationTest
  test "should get questions_index" do
    get lecture_times_questions_index_url
    assert_response :success
  end

end
