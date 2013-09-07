require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should be redorected when user is not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:julian)
    get :new
    assert_response :success
  end

  test "should be logged in to post a status" do 
    post :create, status: { content: "Hellox"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status when logged in" do
    post :create, status: { content: "Hello"}
    assert_difference('Status.count') do
      post :create, status: { content: @status.content }  
    end
  end
end
