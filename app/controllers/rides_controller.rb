class RidesController < ApplicationController

  def new
    @ride = Ride.create(:user_id => current_user.id, :attraction_id => params[:attraction_id])
    raise current_user.inspect
    @ride.save
    @message = @ride.take_ride
    redirect_to user_path(@ride.user, :message => @message)
  end

end
