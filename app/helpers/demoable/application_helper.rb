module Demoable
  module ApplicationHelper
    def check_demoable 
      if Rails.env == Demoable.demo_environment
        if !cookies[:demoable]
          redirect_to demoable.root_path
        end
      end
    end
  end
end
