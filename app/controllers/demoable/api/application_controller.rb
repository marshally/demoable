module Demoable
  class Api::ApplicationController < ActionController::Base
    #make every api controller respond to only json
    respond_to :json
  end
end
