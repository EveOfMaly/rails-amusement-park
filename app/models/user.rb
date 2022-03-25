class User < ActiveRecord::Base
    validates :name, :password_digest, presence: true

    has_secure_password 
    
    has_many :rides 
    has_many :attractions, through: :rides 

    def mood 
        if nausea > happiness
           "sad"
        else 
            "happy"
        end
    end

    def username=(user_id)
        binding.pry
    end
end
