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

  def new
    @event = Event.includes(:trail).find(params[:event_id])
  end

  def create
    # debugger
    @event = Event.find(params[:event_id])
    registration = current_user.profile.event_registrations.new(event_id: params[:event_id])
    registration.save
    redirect_to trail_path(params[:trail_id])
  end

end
