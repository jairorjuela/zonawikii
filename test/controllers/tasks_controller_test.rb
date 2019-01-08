require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test "Should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

end
