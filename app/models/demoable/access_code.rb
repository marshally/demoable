module Demoable
  class AccessCode < ActiveRecord::Base
    attr_accessible :approved, :code, :duration, :email, :requester, :start_time

    # validates :code, :uniqueness => true
    validates :requester, :presence => true
    validates :email, :presence => true
    validates :duration, :presence => true
    validates :start_time, :presence => true

    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    before_save :set_default_values

    def approve_code
      self.approved = true
    end

    def duration_in_seconds
      self.duration.days.to_i
    end

    private
      def set_default_values
        self.approved = false unless self.approved
        self.code = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join unless self.code
      end
  end
end
