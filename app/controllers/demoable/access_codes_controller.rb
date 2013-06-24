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
    def create
        @access_code = AccessCode.new(params[:access_code])
        if @access_code.save
            redirect_to access_codes_path
        else

        end
    end
  end
end
