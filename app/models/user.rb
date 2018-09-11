

class User < ActiveRecord::Base
    has_many :signup
    has_many :events, through: :signup

    def user_info(username)
        User.find_by(username: username).username

    end


    def self.new_user
        puts "Type your new username"
        username = gets.chomp
        User.create(username: username)
        puts "Your username is #{username}"
    end

    def self.get_user
        puts "Type your username"
        username = gets.chomp
        User.find_by(username: username)
        puts "Hello #{username}."
        event_list(username)
    end

    def new_class_signup(class_name)
        Signup.create(username: self, class_name: class_name)
    end
    
end