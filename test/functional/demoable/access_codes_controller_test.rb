require 'test_helper'

module Demoable
  class AccessCodesControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
