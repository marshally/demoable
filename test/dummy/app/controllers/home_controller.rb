class HomeController < ApplicationController
  before_filter :check_demoable

  def index
  end
end
