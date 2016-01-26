# == Schema Information
#
# Table name: profiles
#
#  id                      :integer          not null, primary key
#  first_name              :string
#  family_name             :string
#  date_of_birth           :date
#  email                   :string
#  mobile                  :string
#  gender                  :string
#  nationality             :string
#  country_of_residence    :string
#  passport_number         :string
#  tshirt_size             :string
#  emergency_contact_name  :string
#  emergency_contact_phone :string
#  accepted_terms          :boolean
#  member_of_rta           :boolean
#  rta_number              :integer
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :authorise, only: [:edit, :update]
  before_filter :find_user_and_event, only: [:new, :edit, :update, :create]

  def new
    @profile = @user.profile.new
  end

  def create
    @profile = @user.profile.new(profile_params)
    if @profile.save
      redirect_to trails_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    @profile.update_attributes(profile_params)
    if @profile.save
      if params[:profile][:event]
        event = Event.includes(:trail).find(params[:profile][:event])
        redirect_to new_trail_event_event_registration_path(event.trail.id, event.id)
      else
        render :edit
      end
    else
      render :edit #change this
    end
  end

private
  def profile_params
    params.require(:profile).permit(:first_name, :family_name, :email, :mobile, :date_of_birth, :passport_number, :gender, :nationality, :tshirt_size, :country_of_residence, :emergency_contact_name, :emergency_contact_phone, :accepted_terms)
  end

  def find_user_and_event
    @user = User.find(params[:user_id])
    @event = Event.includes(:trail).find(params[:event]) if params[:event]
  end

  def authorise
    @profile = Profile.find(params[:id])
    unless current_user.profile == @profile || current_user.is_admin?
      flash[:error] = "You can only edit your own profile."
      redirect_to root_path
    end
  end

end
