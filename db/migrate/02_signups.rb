










class Signups < ActiveRecord::Migration[4.2]
    def change
        create_table :signups do |t|
            t.integer :classid
            t.string :classtype
            t.integer :memberid
            t.string :membername
        end
    end
end