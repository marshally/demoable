require_dependency "demoable/api/application_controller"

module Demoable
  class Api::AccessCodesController < ApplicationController
    def index
      render json: { :message => "Hello World!" }
    end
    def create
      
    end
  end
end
