class User < ActiveRecord::Base
    has_many :ratings
    has_many :dishes, through: :ratings




    # - `User#favorite_dish`
    # - returns the `dish` instance that has the highest `score` from this `user`
    def favorite_dish
        
        # .find
        # .find_by( k: v )

        highest_score = self.ratings.maximum( :score )

        Rating.where( score: highest_score ).find{ |each_rating_query| each_rating_query.user_id == self.id }.dish
        
    end




    # - `User#least_favorite_dish`
    # - returns the `dish` instance that has the lowest `score` from this `user`
    def least_favorite_dish

        lowest_score = self.ratings.minimum( :score )

        Rating.where( score: lowest_score ).find{ |each_rating_query| each_rating_query.user_id == self.id }.dish
       
        
    end




    # - `User#remove_ratings(dish)`
    # - takes a `Dish` (an instance of the `Dish` class) and removes _all_ of this `user`'s `rating`s for that `dish`
    # - you will have to delete any rows from the `ratings` table associated with this `user` and the `dish`
    def remove_ratings( dish_passed_in )

        Rating.where( dish_id: dish_passed_in.id ).each do |each_rating_query| 

            if ( each_rating_query.user_id == self.id )

                each_rating_query.destroy

            end
        
        end

    end



    
end