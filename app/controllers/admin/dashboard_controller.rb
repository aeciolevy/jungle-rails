class Admin::DashboardController < ApplicationController

  before_filter :http_basic_auth

  def show
  end
end
