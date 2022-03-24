class Ride < ActiveRecord::Base
    validates :user_id, :attraction_id, presence: true 
    belongs_to :user 
    belongs_to :attraction

    def take_ride 
        if user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}." 
        elsif user.height < attraction.min_height 
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        else 
            new_ticket_number = user.tickets - attraction.tickets 
            user.update(name: user.name, password_digest: user.password_digest, nausea: user.nausea, happiness: user.happiness, tickets: new_ticket_number, height: user.height, admin: user.admin)
            #update the ride
        end

    end
end
