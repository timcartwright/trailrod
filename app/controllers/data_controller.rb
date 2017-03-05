class DataController < ApplicationController

  before_action :authenticate_user!, only: [:create, :update]

  def create
    @datum = Datum.new(datum_params)
    @datum.save
    redirect_to page_path('trail-rodrigues')
  end

  def update
    @datum = Datum.first
    @datum.update_attributes(datum_params)
    @datum.save
    redirect_to page_path('trail-rodrigues')
  end

private

  def datum_params
    params.require(:datum).permit(:participants_44k, :participants_22k, :participants_12k, :participants_7k, :delete_participants_44k, :delete_participants_22k, :delete_participants_12k, :delete_participants_7k)
  end
end
