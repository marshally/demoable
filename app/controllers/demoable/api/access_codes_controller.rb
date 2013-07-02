require_dependency "demoable/api/application_controller"

module Demoable
  class Api::AccessCodesController < ApplicationController
    respond_to :json
  end
end
