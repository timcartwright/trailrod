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

  respond_to :html, :js

  def new
    @event = Event.includes(:trail).find(params[:event_id])
    if current_user.is_admin?
      @registrations = @event.registrations.includes(:profile).all
      @registration = EventRegistration.new
      @trailers = Profile.all
    end
  end

  def create
    @event = Event.find(params[:event_id])
    if current_user.is_admin?
      @registration = EventRegistration.new(registration_params)
      @registration.paid = (@registration.amount > 0)
      @registration.payment_date = Time.now
      @registration.event = @event
      @registration.save
    else
      trailer = current_user.profile
      @event.register(trailer)
      redirect_to @event.trail
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
