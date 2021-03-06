require_dependency "demoable/application_controller"

module Demoable
  class AccessCodesController < ApplicationController

    http_basic_authenticate_with :name => Demoable.admin_user, :password => Demoable.admin_password,
                                 :only => [:approve, :destroy]

    def approve
        @access_code = AccessCode.find(params[:id])
        @access_code.approve_code
        if @access_code.save
            flash[:notice] = "Access Code was approved!"
            redirect_to demoable.root_path
        else
            flash[:error] = "There was some error in approving the code..."
            redirect_to demoable.root_path
        end
    end

    def login
        #nothing
    end

    def signin
        @access_code = AccessCode.find_by_code(params[:access_code])
        if @access_code
            if @access_code.approved
                if DateTime.now >= @access_code.start_time
                    if DateTime.now < @access_code.start_time + @access_code.duration_in_seconds
                        #and NOW we can use sign in using this code
                        cookies[:demoable] = {
                            :value => @access_code.code, 
                            :expires => Time.now + @access_code.duration_in_seconds 
                        }
                        flash[:notice] = "Demo away!"
                        redirect_to main_app.root_path
                    else
                        #code has expired
                        flash[:error] = "The code you are using has expired"
                        redirect_to demoable.root_path
                    end
                else
                    flash[:error] = "Code is being used before its start date"
                    redirect_to demoable.root_path
                end
            else
                flash[:error] = "Code was not approved"
                redirect_to demoable.root_path
                #code was not approved
            end
        else
            flash[:error] = "Invalid Access Code"
            puts "Flash: " + flash.inspect
            redirect_to demoable.root_path
        end
    end

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
        @access_code.start_time = DateTime.strptime(params[:access_code][:start_time], "%m/%d/%Y")
        if @access_code.save
            redirect_to access_codes_path
        else
            puts "#{@access_code.errors.inspect}"
            redirect_to new_access_code_path
            #errors
        end
    end
  end
end
