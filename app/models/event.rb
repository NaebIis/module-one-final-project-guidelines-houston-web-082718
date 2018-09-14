class Event < ActiveRecord::Base

  has_many :signup
  has_many :user, through: :signup
#has many signups and many members though signups.
# has_many :signups
# has_many :members, through: :signups
#class will have a name/kind, class_id, number of spots.
end
