




class Signup < ActiveRecord::Base

    has_many :user
    has_many :event
#belongs to member and an class
# belongs_to :class
# belongs_to :member
# made with a member_id, class_id

    # def new_signup(event)
    #     Signup.create(class_name: event, username: nil)
    # end
end