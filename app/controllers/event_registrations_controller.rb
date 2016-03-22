# == Schema Information
#
# Table name: event_registrations
#
#  id             :integer          not null, primary key
#  event_id       :integer
#  profile_id     :integer
#  paid           :boolean
#  amount         :decimal(, )
#  currency       :string
#  payment_date   :datetime
#  payment_method :string
#  transaction_id :string
#  race_number    :integer
#  race_category  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class EventRegistrationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    event = Event.includes(:trail).find(params[:event_id])
    render csv: EventRegistration.where("event_id = ?", params[:event_id]), filename: "#{event.trail.name}_#{event.distance}k_registrations_#{Time.now.strftime('%d-%m-%Y_%H:%M:%S')}"
  end

  def new
    @event = Event.includes(:trail).find(params[:event_id])
    if current_user.is_admin?
      @registrations = @event.registrations.includes(:profile).all
      @registration = EventRegistration.new
      @trailers = Profile.all
      @profile = Profile.new
    end
  end

  def create
    @admin = current_user.is_admin?
    @event = Event.find(params[:event_id])
    if @admin
      @registration = EventRegistration.new(registration_params)
      # @registration.paid = (@registration.amount > 0)
      @registration.payment_date = Time.now
      @registration.event = @event
      @registration.save
    else
      trailer = current_user.profile
      @event.register(trailer)
      @trail = @event.trail
      @trail.events.each do |event|
        if current_user.profile.is_registered?(event)
          @registered_event = event
        end
      end
    end
  end

  def destroy
    @registration = EventRegistration.find(params[:id])
    @registration.destroy
  end

private
  def registration_params
    params.require(:event_registration).permit(:amount, :currency, :payment_method, :race_category, :profile_id)
  end

end
