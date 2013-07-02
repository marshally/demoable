require "demoable/engine"

module Demoable
  def self.setup
    yield self
  end

  mattr_accessor :admin_user
  @@admin_user = 'admin'

  mattr_accessor :admin_password
  @@admin_password = 'password needs changing'

  mattr_accessor :demo_environment
  @@demo_environment = 'qa'

  mattr_accessor :access_code_length
  @@access_code_length = 10
end
