class Dish < ActiveRecord::Base
    has_many :ratings
    has_many :users, through: :ratings




    # - `Dish#leave_rating(user, score, reason, recommended_price)`
        # - takes a `User` (an instance of the `User` class), 
        # a `score` (integer), 
        # a `reason` (string), 
        #  and a `recommended_price` (float) 
    # as arguments, 
    # and creates a new `Rating` 
    # in the database associated with this `Dish` and the `User`

    def leave_rating( user_instance , score_passed_in , reason_passed_in , recommended_price_passed_in  )

        Rating.create(  

            score: score_passed_in,
            reason: reason_passed_in,
            recommended_price: recommended_price_passed_in,

            dish_id: self.id,
            user_id: user_instance.id 

        )

    end




    # - `Dish # print_all_ratings`
    # - should `puts` to the terminal a string representing each `rating` for this `dish`
    # - each `rating` should be formatted as follows: `Rating for {insert dish name} by {insert user name}: {insert rating score}. Becuase, {insert rating reason}`

    def print_all_ratings

        #  dish_instance_being_called_on == self
        #  self = dish_instance_being_called_on
        

        #### Using .each
        # ratings_array = []
        
        # self.ratings.each do | each_rating | 
        
        #     ratings_array.push( each_rating )

        # end

        # ratings_array.each do | each_rat |

        #     puts "Rating for #{each_rat.dish.name} by #{each_rat.user.name}: #{each_rat.score}. Becuase, #{each_rat.reason}"
        
        # end


        #### Using .map
        self.ratings.map do | each_rat |

            puts "Rating for #{each_rat.dish.name} by #{each_rat.user.name}: #{each_rat.score}. Becuase, #{each_rat.reason}"
        
        end

       
    end




    # - `Dish # average_rating`
    # - returns a `float` representing the average `score` for all `rating`s for this `dish`
    # - remember that the average of something is the sum of all the values, divided by the number of values:
    #     - the average of 1,1,1  : (1 + 1 + 1)/3
    #     - the average of 2,2,2  : (2 + 2 + 2)/3
    #     - the average of 3,3,3  : (3 + 3 + 3)/3
    #     - the average of 1,2,3,4: (1 + 2 + 3 + 4)/4
    def average_rating

        # self == that_dish_instance


        #### Active Record Querying 

        # self.ratings.average( :score ).to_f


        #### using .sum + .fdiv( )

        score_array = []

        self.ratings.each do | each_rating |
            
            score_array << each_rating.score
            
        end

        score_array.sum.fdiv( score_array.size )


    end



    # - `Dish # is_dish_popular`
    # - returns `true` 
        # if `dish` has an average score above a 5, 
    # or `false` if the `dish` has an average score below 5
    def is_dish_popular?

        if ( self.average_rating > 5 )
            return true
        else #   self.average_rating < 5
            return false 
        end

    end
    
end