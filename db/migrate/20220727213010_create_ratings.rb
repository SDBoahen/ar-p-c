class CreateRatings < ActiveRecord::Migration[6.1]
  def change

    create_table :ratings do |t|

      t.integer :score

      t.string :reason

      t.float :recommended_price
    
      t.integer :user_id  #X# user.id
      t.integer :dish_id

    end

  end
end
