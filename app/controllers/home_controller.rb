class HomeController < ApplicationController

  before_filter :disable_nav, only: [:land]

  def land
    @home = Home.new
  end

private
  def disable_nav
    @disable_nav = true
  end
end