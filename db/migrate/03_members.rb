






class Members < ActiveRecord::Migration[4.2]

    def change
        create_table :members do |t|
            t.string :name
            t.integer :age
            t.string :gender
            # t.integer :member_id
        end
    end
end