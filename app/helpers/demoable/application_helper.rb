module Demoable
  module ApplicationHelper
    def check_demoable
      puts "hitting this!"
      if !cookies[:demoable]
        redirect_to demoable.root_path
      else
        puts cookies[:demoable]
      end
    end
  end
end
