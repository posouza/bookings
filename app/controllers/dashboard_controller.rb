class DashboardController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def index

  end
end
