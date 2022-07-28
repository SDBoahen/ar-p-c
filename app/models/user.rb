class User < ActiveRecord::Base
    #### Association Macros 
    has_many :ratings
    has_many :dishes, through: :ratings


    #### Instance Methods

    # User#favorite_dish
    # returns the dish instance that has the highest score from this user
    def favorite_dish 

       highest_score = self.ratings.maximum( :score )

       self.ratings.each do | each_rating | 

            if( each_rating.score === highest_score )
                return each_rating.dish
            end
    
       end


       return "No Ratings or No Rating with Highest Score "
    end

    # User#least_favorite_dish
    # returns the dish instance that has the lowest score from this user
    def least_favorite_dish

        lowest_score = self.ratings.minimum( :score )

        self.ratings.each do | each_rating | 
 
             if( each_rating.score === lowest_score )
                 return each_rating.dish
             end
     
        end
 
 
        return "No Ratings or No Rating with Highest Score "
    end




    # User#remove_ratings(dish)
    # takes a Dish (an instance of the Dish class) 
    #   and removes all of this user's ratings   * for that dish *
    #   you will have to delete any rows (instances) from the ratings table associated with this user and the dish
    # 
    # CRU[ D ]
    def remove_ratings( dish_in ) 

            # self -> #< user >  ~  User.rb
        # dish_in
            # rating_instance.destroy

        self.ratings.each do |rating_instance|

            # U -< [|] R [|]>- D
            if( rating_instance.dish.id === dish_in.id )

                rating_instance.destroy

            end
        end


    end
   
    


end