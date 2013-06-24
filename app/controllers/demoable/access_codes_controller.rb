require_dependency "demoable/application_controller"

module Demoable
  class AccessCodesController < ApplicationController
    def index
    	@access_codes = AccessCode.all
    end
    def show
    	@access_code = AccessCode.find(params[:id])
    end

    def new
    	@access_code = AccessCode.new
    end
  end
end
