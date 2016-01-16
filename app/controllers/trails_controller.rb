# == Schema Information
#
# Table name: trails
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  location        :string
#  date            :datetime
#  external_link   :string
#  register_online :boolean
#  organiser       :string
#  course          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    @trail = Trail.new
  end

  def create
    # debugger
    @trail = Trail.new(trail_params)
    if @trail.save
      redirect_to new_trail_event_path(@trail)
    else
      render :new
    end
  end

private
  def trail_params
    params.require(:trail).permit(:name, :date, :location, :organiser, :description, :external_link, :register_online)
  end

end
