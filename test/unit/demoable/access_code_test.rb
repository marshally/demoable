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

      access_code = Demoable::AccessCode.create(:requester => "Lame Sauce", :email => "bob@bob.com", :duration => 1)
      assert_equal access_code.errors[:start_time].empty?, false            
    end

    test "a code should be unapproved by default" do
      access_code = Demoable::AccessCode.create(:requester => "Bob", :email => "Bob@bob.com", :duration => 1, :start_time => Time.now)
      assert_equal false, access_code.approved
    end

    test "a code will be generated after it is saved" do
      access_code = Demoable::AccessCode.create(:requester => "Bob", :email => "Bob@bob.com", :duration => 1, :start_time => Time.now)
      assert_not_nil access_code.code
    end

    test "a code should be able to be approved" do
      access_code = Demoable::AccessCode.create(:requester => "Bob", :email => "Bob@bob.com", :duration => 1, :start_time => Time.now)
      access_code.approve_code
      assert access_code.approved
    end
  end
end
  