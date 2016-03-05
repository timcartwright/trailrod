# == Schema Information
#
# Table name: trails
#
#  id                   :integer          not null, primary key
#  name                 :string
#  description          :text
#  location             :string
#  date                 :datetime
#  external_link        :string
#  register_online      :boolean
#  organiser            :string
#  course               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  results_file_name    :string
#  results_content_type :string
#  results_file_size    :integer
#  results_updated_at   :datetime
#

class TrailsController < ApplicationController

  respond_to :html, :js

  before_action :authenticate_user!, only: [:new, :create, :update]

  def index
    @trails = Trail.all.order(:date).includes(:events)
    @next_trail ||= Trail.includes(:events).where('date >= ?', DateTime.now).order(date: :asc).first
  end

  def show
    @trail = Trail.includes(:events).find(params[:id])
    @profile = current_user.profile || Profile.new if user_signed_in?
    @participants = Hash.new
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

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    trail = Trail.find(params[:id])
    trail.update_attributes(trail_params)
    trail.save!
    redirect_to trail
  end

private
  def trail_params
    params.require(:trail).permit(:name, :date, :location, :organiser, :description, :external_link, :register_online, :results)
  end

end
