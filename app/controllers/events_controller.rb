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
#  departure         :string
#  arrival           :string
#  course            :text
#

class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_trail, only: [:new, :create, :edit, :update]
  before_action :find_event, only: [:edit, :update]

  def new
    @event = @trail.events.new
  end

  def create
    @event = @trail.events.new(event_params)
    if @event.save
      redirect_to @trail
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update_attributes(event_params)
    @event.save!
    redirect_to @trail
  end

private
  def find_trail
    @trail = Trail.find(params[:trail_id])
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :distance, :departure, :arrival, :course, :local_price, :foreign_price)
  end
end
