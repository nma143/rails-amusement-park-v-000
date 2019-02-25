class RidesController < ApplicationController

  def new

    @ride = Ride.create(:user_id => current_user.id, :attraction_id => params[:attraction_id])
    @ride.save
    @message = @ride.take_ride
    raise @message.inspect
    redirect_to user_path(@ride.user, @message)
  end

end
