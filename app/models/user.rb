class User < ActiveRecord::Base
    validates :name, :password, presence: true

    has_secure_password 
    
    has_many :rides 
    has_many :attractions, through: :rides 

    def mood 

    end
end
