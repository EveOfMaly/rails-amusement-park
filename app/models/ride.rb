class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction


    
    def take_ride 
        if (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}." 
        elsif user.height < attraction.min_height 
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else 
            new_ticket_number = user.tickets - attraction.tickets 
            new_nausia = user.nausea + attraction.nausea_rating
            new_happiness = user.happiness + attraction.happiness_rating
            user.update(name: user.name, password_digest: user.password_digest, nausea: new_nausia, happiness: new_happiness, tickets: new_ticket_number, height: user.height, admin: user.admin)
            #update the ride
            user
        end

    end
end
