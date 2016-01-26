# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  distance          :integer
#  local_price       :integer
#  foreign_price     :integer
#  registration_open :boolean
#  trail_id          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class EventsController < ApplicationController

  def new
    @trail = Trail.find(params[:trail_id])
    @event = @trail.events.new
  end

  def create
    @trail = Trail.find(params[:trail_id])
    @event = @trail.events.new(event_params)
    if @event.save
      redirect_to @trail
    else
      render :new
    end
  end

private
  def event_params
    params.require(:event).permit(:name, :description, :distance, :local_price, :foreign_price)
  end
end
