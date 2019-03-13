class HomeController < ApplicationController
  def index
    @activities = Activity.active.all
  end
end
