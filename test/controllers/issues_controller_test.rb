require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    @issue = create(:issue)
  end

  test "for apipie" do
    get :index, lat: 18, lng: 72, area: 1000, :format => :json
    assert_response :success

    get :show, id: @issue, lat: 10, lng: 10, :format => :json
    assert_response :success
  end

  test "should get index" do
    get :index, lat: 18, lng: 72, area: 1000, :format => :json
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
      post :create, issue: {issue_type: @issue.issue_type, description: @issue.description, latitude: @issue.latitude, longitude: @issue.longitude, status: @issue.status}
    end
    assert_redirected_to issue_path(assigns(:issue))

    assert_difference('Issue.count') do
      post :create, issue: { issue_type: @issue.issue_type, description: @issue.description, latitude: @issue.latitude, longitude: @issue.longitude, status: @issue.status}, :format => :json
    end
    assert_response :created
  end

  test "should show issue" do
    get :show, id: @issue, lat: 10, lng: 10, :format => :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue
    assert_response :success
  end

  test "should update issue" do
    patch :update, id: @issue, issue: { description: @issue.description, latitude: @issue.latitude, longitude: @issue.longitude, status: @issue.status, issue_type: @issue.issue_type }
    assert_redirected_to issue_path(assigns(:issue))

    patch :update, id: @issue, issue: { description: @issue.description, latitude: @issue.latitude, longitude: @issue.longitude, status: @issue.status, issue_type: @issue.issue_type }, :format => :json
    assert_response 204
  end

  test "should destroy issue" do
    issue = create(:issue)
    assert_difference('Issue.count', -1) do
      delete :destroy, id: issue
    end
    assert_redirected_to issues_path

    issue = create(:issue)
    assert_difference('Issue.count', -1) do
      delete :destroy, id: issue, :format => :json
    end
    assert_response 204
  end
end
