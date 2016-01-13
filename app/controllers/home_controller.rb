class HomeController < ApplicationController
  def land
    @home = Home.new
  end
end