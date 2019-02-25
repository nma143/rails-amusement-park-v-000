class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    enough_tickets, tall_enough = meet_requirements
    if self.user.tickets >= self.attraction.tickets #enough tickets

      if self.user.height >= self.attraction.min_height #tall enough
        #enough tickets and tall enough -> take the ride
        self.user.update(
          :tickets => self.user.tickets - self.attraction.tickets,
          :happiness => self.user.happiness + self.attraction.happiness_rating,
          :nausea => self.user.nausea + self.attraction.nausea_rating
        )
        "Thanks for riding the #{self.attraction.name}!"

      else
        "Sorry, not tall enough"
      end

    else
      "Sorry, not enough tickets"
    end
  end


end
