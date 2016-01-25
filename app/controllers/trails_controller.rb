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
    @trails = Trail.all.includes(:events)
  end

  def show
    @trail = Trail.includes(:events).find(params[:id])
    @trail.events.each do |event|
      @registered_event = event if current_user.profile.event_registrations.find_by(event_id: event.id)
    end
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
