class Dish < ActiveRecord::Base
    has_many :ratings
    has_many :users, through: :ratings



    # - `Dish#leave_rating(user, score, reason, recommended_price)`
    # - takes a `User` (an instance of the `User` class), a `score` (integer), a `reason` (string), and a `recommended_price` as arguments, and creates a new `Rating` in the database associated with this `Dish` and the `User`
    def leave_rating( user , score , reason , recommended_price )

        Rating.create(  

            score: score,
            reason: reason,
            recommended_price: recommended_price,
            dish_id: self.id,
            user_id: user.id 

        )

    end

    # - `Dish#print_all_ratings`
    #     - should `puts` to the terminal a string representing each `rating` for this `dish`
    #     - each `rating` should be formatted as follows: `Rating for {insert dish name} by {insert user name}: {insert rating score}. Becuase, {insert rating reason}`
    def print_all_ratings
        
        self.ratings.each{ | each_rating | each_rating.print_rating }
        
    end

    # - `Dish#average_rating`
    #     - returns a `float` representing the average `score` for all `rating`s for this `dish`
    #     - remember that the average of something is the sum of all the values, divided by the number of values:
    #     - the average of 1,1,1  : (1 + 1 + 1)/3
    #     - the average of 2,2,2  : (2 + 2 + 2)/3
    #     - the average of 3,3,3  : (3 + 3 + 3)/3
    #     - the average of 1,2,3,4: (1 + 2 + 3 + 4)/4
    def average_rating


        #### .average

        # self.ratings.average( :score ).to_f


        #### .sum + .size
        self.ratings.map{ |each_rating| each_rating.score }.sum/self.ratings.size.to_f

            # sum_of_results = self.ratings.map{ |each_rating| each_rating.score }.sum
            # amount_of_numbers = self.ratings.size.to_f

            # sum_of_results / amount_of_numbers


    end



    # - `Dish#is_dish_popular`
    # - returns `true` if `dish` has an average score above a 5, or `false` if the `dish` has an average score below 5
    def is_dish_popular?

        if ( self.average_rating > 5 )
            true
        else
            false
        end

    end    






end