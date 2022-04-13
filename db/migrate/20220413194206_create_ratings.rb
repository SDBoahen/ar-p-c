





class CreateRatings < ActiveRecord::Migration[6.1]
  def change

    create_table :ratings do |t|

      t.integer :score
      t.string :reason
      t.float :recommended_price

      #### Foriegn Keys
        t.integer :dish_id
        t.integer :user_id
      #### Foriegn Keys
    end

  end
end
