require 'test_helper'

module Demoable
  class AccessCodeTest < ActiveSupport::TestCase
    test "a code should validate properly" do
      #needs a name
      access_code = Demoable::AccessCode.create(:email => "false@test.com")
      assert_equal access_code.errors[:requester].empty?, false

      #needs an email
      access_code = Demoable::AccessCode.create(:requester => "Lame Sauce")
      assert_equal access_code.errors[:email].empty?, false

      #needs properly formatted email
      access_code = Demoable::AccessCode.new(:requester => "Lame Sauce", :email => "bademailformat")
      assert_equal access_code.save, false, "email validation failed"       #TODO: Fix this

      #no duration
      access_code = Demoable::AccessCode.create(:requester => "Lame Sauce", :email => "bob@bob.com")
      assert_equal access_code.errors[:duration].empty?, false


    end

    test "a code should be unapproved by default" do
      access_code = Demoable::AccessCode.create(:requester => "Bob", :email => "Bob@bob.com", :duration => 1)
      assert_equal false, access_code.approved
    end
  end
end
  