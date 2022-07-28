class Dish < ActiveRecord::Base
    #### Association Macros
    has_many :ratings
    has_many :users, through: :ratings


    #### Instance Methods

    # Dish#leave_rating( user, score, reason, recommended_price )
    # takes 
    #   a User (an instance of the User class), 
    #   a score (integer),
    #   a reason (string), 
    #   and a recommended_price (float)
    # as arguments,
    #  
    # and creates a new Rating in the database associated with this Dish and the User
    
    # [ C ]RUD
    def leave_rating( user_in , score_in , reason_in , recommended_price_in )

        # self -> the dish instance
        Rating.create( 

            score: score_in,
            reason: reason_in,
            recommended_price: recommended_price_in,

            user_id: user_in.id,
            dish_id: self.id

        )

    end




    # Dish#print_all_ratings
    # should puts to the terminal 
    #   a string representing each rating for this dish ~ .each, .map
    # each rating should be formatted as follows: Rating for {insert dish name} by {insert user name}: {insert rating score}. Becuase, {insert rating reason}
    def print_all_ratings 
    
        # iteration
        self.ratings.each do | rating_instance |        #       | rating_instance |

            rating_instance.print_rating
            # puts " Rating for #{self.name} by #{each_rating.user.name}: #{each_rating.score}. Becuase, #{each_rating.reason}"

        end

    
    end
    
    
    

    # Dish#average_rating
    # returns a float representing the average score for all ratings for this dish
    # remember that the average of something is the sum of all the values, divided by the number of values:
    # the average of 1,1,1 : (1 + 1 + 1)/3
    # the average of 2,2,2 : (2 + 2 + 2)/3
    # the average of 3,3,3 : (3 + 3 + 3)/3
    # the average of 1,2,3,4: (1 + 2 + 3 + 4)/4
    def average_rating


        average_rating_for_dish = 0.00

        total_scores_value = 0.00
        

        self.ratings.each do | each_rating |

            total_scores_value = total_scores_value + each_rating.score

        end 

        average_rating_for_dish = total_scores_value / self.ratings.count

        # .to_f
        # .to_i

        return average_rating_for_dish

    end




    
    # Dish#is_dish_popular
    # returns true if dish has an average score above a 5, 
    # or false if the dish has an average score below 5

    def is_dish_popular


        if ( self.average_rating > 5 )

            return true

        else # ( self.average_rating < 5 )

            return false

        end

    end

    
end