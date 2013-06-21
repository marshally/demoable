module Demoable
  class AccessCode < ActiveRecord::Base
    attr_accessible :approved, :code, :duration, :email, :requester, :start_time
  end
end
