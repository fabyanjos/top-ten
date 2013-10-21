require 'test_helper'

class VoteControllerTest < ActionController::TestCase

  setup do
    session[:user_id] = users(:one)
    @survey = surveys(:top5bands)
  end	

  test "should get index" do
    get :index, survey_id: @survey
    assert_response :success
  end

end
