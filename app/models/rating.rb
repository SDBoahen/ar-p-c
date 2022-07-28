class Rating < ActiveRecord::Base
    #### Assocation Macros
    belongs_to :user
    belongs_to :dish


    #### Instance Methods

    # Rating#print_rating
    # should puts
    #  to the terminal a string 
    # formatted as follows: Rating for {insert dish name} by {insert user name}: {insert rating score}. Becuase, {insert rating reason}
    def print_rating 

        puts "Rating for #{self.dish.name} by #{self.user.name}: #{self.score}. Becuase, #{self.reason}"
   
    end

end