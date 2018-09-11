




class Signups < ActiveRecord::Migration[4.2]

    def change
        create_table :signups do |t|
            t.string :username
            t.string :class_name
        end
    end
end