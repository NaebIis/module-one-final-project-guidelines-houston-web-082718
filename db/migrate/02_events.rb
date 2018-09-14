class Events < ActiveRecord::Migration[4.2]

  def change
    create_table :events do |t|
      t.string :name
      t.integer :slots
      t.string :location
    end
  end
end
