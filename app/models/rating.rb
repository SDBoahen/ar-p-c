class Rating < ActiveRecord::Base
    belongs_to :dish 
    belongs_to :user 



    # - `Rating # print_rating`
    # - should `puts` to the terminal a string formatted as follows: 
    # `Rating for {insert dish name} by {insert user name}: {insert rating score}. Becuase, {insert rating reason}`
    def print_rating
        # self == instance_rating_being_called_on

        puts "Rating for #{self.dish.name} by #{self.user.name}: #{self.score}. Becuase, #{self.reason}"
        # puts `Rating for {insert dish name} by {insert user name}: {insert rating score}. Becuase, {insert rating reason}`

    end


end