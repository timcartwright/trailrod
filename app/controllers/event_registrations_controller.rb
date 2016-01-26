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

  def new
    @event = Event.includes(:trail).find(params[:event_id])
    @registration = EventRegistration.new
    @trailers = Profile.all
  end

  def create
    if current_user.is_admin?
      trailer = Profile.find(params[:event_registration][:profile_id]) || current_user.profile
    else
      trailer = current_user.profile
    end
    event = Event.find(params[:event_id])
    event.register(trailer)
    redirect_to event.trail
  end

private
  

end
