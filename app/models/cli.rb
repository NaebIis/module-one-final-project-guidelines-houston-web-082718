
class Cli


    def call
        status = "start"
        current_username = nil
        while true
            if current_username
                case status
                when"get_user"
                    status = "event_list"
                when "event_list"
                    status = Cli.event_list(current_username)
                when "new_user"
                    status = User.new_user(current_username)
                when "my_stuff"
                    status = Cli.my_stuff(current_username)
                when "event_list_new_signup"
                    status = Cli.event_list_new_signup(current_username)
                when "user_info"
                    status = Cli.user_info(current_username)
                    # binding.pry
                when "type_username_again" 
                    # binding.pry
                    current_username = User.type_username_again
                    status = "my_stuff"
                when "user_classes"
                    status = Cli.user_classes(current_username)
                when "chosing_event"
                    status = Cli.chosing_event(current_username)
                when "delete"
                    status = Cli.delete(current_username)
                when "new_username"
                    current_username = Cli.new_username(current_username)
                    status = "my_stuff"
                when "event_list_new_signup"
                    status = Cli.event_list_new_signup(current_username)
                when "exit"
                    break
                end
            else
                case status
                when "start"
                    status = start
                when "run_file"
                    status = run_file
                when "get_user"
                    if current_username = User.get_user
                    status = "event_list"
                    else
                        #binding.pry
                        status = "not_a_member"
                    end

                when "my_stuff"
                    current_username = User.get_user
                    status = "my_stuff"
                    
            
                when "new_username"
                    current_username = Cli.new_username
                    status = "my_stuff"
                when "new_user"
                    status = User.new_user
                when "not_a_member"
                    # status = User.not_a_member
                    current_username = User.not_a_member
                    status = "my_stuff"
                when "exit"
                    break
                end

            end

            if status == "exit"
                break
            end
        end
    end

    def start
        puts "Hello! Welcome to our 24h!"
        puts "Are you a member?"
        status = "run_file"
    end

    def run_file
        puts "type yes or no"
        input = gets.chomp.downcase
        if input == "yes"
            status = "get_user"           
        elsif input == "no"
            status = "new_user"
        elsif input == "exit"
            puts "See you next time!"
            status = "exit"
        else
            puts "Say again?? Type yes or no. If you wish to leave type exit" 
            status = "run_file"
        end
    end

    def self.event_list(username)
        puts "Do you wish to see all the classes you are in or view your profile? Type yes or no."
        input = gets.chomp.downcase
        if input == "yes"
            status = "my_stuff"
        elsif input == "no"
            status = "event_list_new_signup"
        elsif input == "exit"
            puts "Byeeee!"
        else
            puts "What?"
            status = "event_list"
        end 
    end

    def self.my_stuff(username)
        puts "Profile Options"
        puts "Type 1, 2, 3, 4 or 5"
        puts "\n"
        puts "1. your profile"
        puts "2. list events"
        puts "3. delete profile"
        puts "4. update profile"
        puts "5. Event sign-up"
        puts "6. exit"
        input = gets.chomp.downcase
        if input == "1"
            status = "user_info"
        elsif input == "2"
            status = "user_classes"
        elsif input == "3"
            status = "delete"
        elsif input == "4"
            status = "new_username"   
        elsif input == "5"
            status = "event_list_new_signup"
        elsif input == "6"
            puts "Goodbyeeeeeee!"
            status = "exit"
        else
            puts "\n"
            puts "\n"
            puts "What?"
            puts "\n"
            puts "\n"
            status = "my_stuff"
        end
    end

    def self.user_info(current_username)
        # binding.pry
        puts "\n"
        puts "\n"
        puts "Your username is #{User.find_by(username: current_username).username}"
        puts "\n"
        puts "\n"
        status = "my_stuff"
    end

    def self.user_classes(username)
        puts does_user_have_classes(username)
        # puts "Would you like to join any classes? Type yes or no"
        # input2 = gets.chomp.downcase
        #     if input2 == "yes"
        #         Event.all.each do |event|
        #         puts event.name
        #     end
        status = "my_stuff"
    end



    def self.does_user_have_classes(username)
        if Signup.find_by(username: username)
            puts "\n"
            puts "\n" 
            Signup.all.select do |signup|
                if signup.username == username
                    puts signup.class_name
                end
            end
            puts "\n"
            puts "\n"
        else 
            puts "You have no classes"
        end
    end

    def self.chosing_event(username)
        puts "Which class would you like to join?"
            # puts Event.all.each do |event|
            #     puts event.name
            # end
        input = gets.chomp.downcase
        if input == "yoga" || input =="1"
            new_signup("yoga", username)
        elsif input == "kickboxing" || input == "4"
            new_signup("Kickboxing", username)
        elsif input == "spinclass" || input == "2"
            new_signup("spinclass", username)
        elsif input == "intro to pilate" || input == "5"
            new_signup("Intro to pilate", username)
        elsif input == "Swim class" || input == "3"
            new_signup("Swim class", username)
        else 
            puts "What are you tring to say?"
            # status = "chosing_event"
        end
        puts "\n"
        puts "You are now signed up for an event"
        puts "\n"
        puts "\n"
        status = "my_stuff"
    end

    def self.delete(username)
        username = User.find_by(username: username)
            username.destroy
        puts "Your account is deleted, thank you for giving us your money for so long you..."
        status = "exit"
    end


    def self.new_signup(event, username)
        Signup.create(class_name: event, username: username)
    end

    def self.event_list_new_signup(username)
        puts "Would you like to sign-up for classes?"
            input2 = gets.chomp.downcase
        if input2 == "yes"
            puts "\n"
            puts "\n"
            Event.all.each do |event|
                puts event.name
            end
            puts "\n"
            puts "\n"
            status = "chosing_event"
        elsif input2 == "no"
            puts "Goodbyeeeeeee!"
            status = "exit"
        else 
            puts "What?"
            status = "event_list_new_signup"
        end  
    end


    def self.new_username(username)
    puts "What would you like your new username to be?"
        new_name = gets.chomp
            # User.update(username: new_name)
            user = User.find_by(username: username)
            user.username = new_name
            user.save
            puts "\n"    
        puts "Your new username is '#{new_name}'."
        puts "\n"
        puts "\n"
        new_name    
        # binding.pry
    end
end