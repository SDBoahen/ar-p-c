class User < ActiveRecord::Base
    has_many :ratings
    has_many :dishes, through: :ratings




    # - `User # favorite_dish`
    # - returns the `dish` instance that has the highest `score` from this `user`
    def favorite_dish 

        # self == user_instance

        ### using .maxium .... Lolol

        # highscore = self.ratings.maximum( :score )

        # highest_rating = Rating.find_by( score: highscore )

        # return highest_rating.dish



        #### using .max

        max_score = self.ratings.map{ | each_rating | each_rating.score }.max
        
        highest_rating = Rating.find_by( score: max_score )
        
        return highest_rating.dish


    end




    # - `User # least_favorite_dish`
    # - returns the `dish` instance that has the lowest `score` from this `user`
    def least_favorite_dish 

        ### using .minium .... Lolol

        highscore = self.ratings.minimum( :score )

        highest_rating = Rating.find_by( score: highscore )

        return highest_rating.dish



        #### using .min

        # min_score = self.ratings.map{ | each_rating | each_rating.score }.min
        
        # highest_rating = Rating.find_by( score: min_score )
        
        # return highest_rating.dish
        
    end




    # - `User # remove_ratings(dish)`
    # - takes a `Dish` (an instance of the `Dish` class) 
    # and removes _all_ of this `user`'s `rating`s for that `dish`
    #
    # - you will have to delete any rows from the `ratings` table 
    # associated with this `user` and the `dish`
    def remove_ratings( dish_passed_in )

      # self == that_user_instance

      
        #### using .destory + .each

        # self.ratings.each do | each_rating |
            
        #     if ( each_rating.dish.id == dish_passed_in.id )
                
        #         each_rating.destroy

        #     end

        # end


        #### using .destory_all + .filter

        result_of_filter = self.ratings.filter do | each_rating |
            
            each_rating.dish.id == dish_passed_in.id
        
        end

        result_of_filter.each do | each_rating |
            
            each_rating.destroy
        
        end


            # Feel Free to Play With 🤷🏾‍♂️
            # Rating.where( user_id: self.id && dish_id: dish_passed_in.id ).destory_all

            # result_of_filter.destroy_all



        # .destroy

        # X .delete  

    end

    
end