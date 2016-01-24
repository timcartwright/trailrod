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

  def new
    @profile = Profile.new
  end

  def create
    debugger
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to trails_path
    else
      render :new
    end
  end

private
  def profile_params
    params.require(:profile).permit(:first_name, :family_name, :email, :mobile, :date_of_birth, :passport_number, :gender, :nationality, :tshirt_size, :country_of_residence, :emergency_contact_name, :emergency_contact_phone, :accepted_terms)
  end


end
