require "demoable/engine"

module Demoable
  def self.setup
    yield self
  end

  mattr_accessor :admin_user
  @@admin_user = "admin"

  mattr_accessor :admin_password
  @@admin_password = "password needs changing"

  def check_demoable
    puts cookies

    if !cookies[:demoable]
      redirect_to "/demoable"
    else
      puts cookies[:demoable]
    end
  end
end
