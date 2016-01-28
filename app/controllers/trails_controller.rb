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

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @trails = Trail.all.includes(:events)
  end

  def show
    @trail = Trail.includes(:events).find(params[:id])
    @participants = Hash.new
    @profile = current_user.profile || current_user.profile.new
    @trail.events.each do |event|
      @participants[event] = event.participants
      if user_signed_in? && current_user.has_profile? && current_user.profile.is_registered?(event)
        @registered_event = event
      end
    end
  end

  def new
    @trail = Trail.new
  end

  def create
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
