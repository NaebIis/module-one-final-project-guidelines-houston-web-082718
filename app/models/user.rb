

class User < ActiveRecord::Base
    has_many :signup
    has_many :events, through: :signup


    def self.new_user
        puts "Type your new username"
        # binding.pry

        username = gets.chomp.downcase
        User.create(username: username)
        # puts "Your username is #{username}"
        # status = "get_user"
        pass(username)
    end

    def self.not_a_member
        puts "You are not a member"
        puts "would you like to join our gym?"
        input = gets.chomp.downcase
        if input == "yes"
            puts 'what do you want your username to be?'
            name = gets.chomp.downcase
            User.create(username: name)
            puts "Your username is #{name}"
            # status = "get_user"
            User.pass(name)
            else input == "no"
                puts "See you next time!"
                status = "exit"
            end
        end

    def self.pass(username)
        # puts "Type your username"
        # username = gets.chomp
        # if User.find_by(username: username)
            puts "Hello #{username}."
            username
        # else 
        #     false
        # end
    end

    def type_username_again
        puts "Type your username again to verify"
        username = gets.chomp
        if User.find_by(username: username)
            # puts "would you like to see your profile #{username}?"
            username
        else 
            puts "Error: Username does not match"
            status = "my_stuff"
        end
    end

    def self.get_user
        puts "Type your username"
        username = gets.chomp
        if User.find_by(username: username)
            puts "Hello #{username}."
            username
        else 
            false
        end
    end

    # def self.get_user_verify
    #     puts "Type your username agian to verify"
    #     username = gets.chomp
    #     if User.find_by(username: username)
    #         puts "Hello #{username}."
    #         username
    #     else 
    #         puts "You are not a member"
    #         puts "would you like to join our gym?"
    #         input = gets.chomp.downcase
    #         if input == "yes"
    #             status = "new_user"
    #         elsif input == "no"
    #             puts "See you next time!"
    #         end
    #     end
    # end

    def new_class_signup(class_name)
        Signup.create(username: self, class_name: class_name)
    end
end