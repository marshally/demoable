class HomeController < ApplicationController
  include Demoable::ApplicationHelper
  
  before_filter :check_demoable

  def index
  end
end
