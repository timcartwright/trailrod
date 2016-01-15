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
    @event = Event.new
    @trail = Trail.find(params[:trail_id])
  end

  def create
    debugger
    @event = Event.new(event_params)
    redirect_to trails_path
  end

private
  def event_params
    params.require(:event).permit(:name, :description, :distance, :local_price, :foreign_price)
  end
end
