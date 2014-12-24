require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'index should render correct template and layout' do
    get :index
    assert_template :index
    assert_template layout: 'layouts/application'
  end

end
