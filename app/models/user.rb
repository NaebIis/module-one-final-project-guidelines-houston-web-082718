

class User < ActiveRecord::Base
    has_many :signup
    has_many :events, through: :signup


    def self.new_user
        puts "Type your new username"
        username = gets.chomp
        User.create(username: username)
        puts "Your username is #{username}"
        Cli.my_stuff(username)
    end

    def self.get_user
        puts "Type your username"
        username = gets.chomp
        if User.find_by(username: username)
            puts "Hello #{username}."
            Cli.event_list(username)
        else 
            puts "You are not a member"
            puts "would you like to join our gym?"
            input = gets.chomp.downcase
            if input == "yes"
                new_user
            elsif input == "no"
                puts "See you next time!"
            end
        end
    end

    def new_class_signup(class_name)
        Signup.create(username: self, class_name: class_name)
    end
    
end