

class User < ActiveRecord::Base
    has_many :signup
    has_many :events, through: :signup


    def self.new_user
        puts "Type your new username"
        username = gets.chomp
        User.create(username: username)
        puts "Your username is #{username}"
        status = "get_user"
    end

    def self.get_user
        puts "Type your username"
        username = gets.chomp
        user = User.find_by(username: username)
        if user
            puts "Hello #{username}."
            username
        else 
            puts "You are not a member"
            puts "would you like to join our gym?"
            input = gets.chomp.downcase
            if input == "yes"
                status = "new_user"
            elsif input == "no"
                puts "See you next time!"
                status = "exit"
            end
        end
    end

    def new_class_signup(class_name)
        Signup.create(username: self, class_name: class_name)
    end
end