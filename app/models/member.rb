




class Member < ActiveRecord::Base
#member has many signups and many classes through signups
# belongs_to :class

# has_many :signups
# has_many :classes, through: :signups
# A member will have a name, an age and a gender.
end