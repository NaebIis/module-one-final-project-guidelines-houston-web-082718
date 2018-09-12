
class Cli
    def call
        self.start
    end

    def self.does_user_have_classes(username)
        # if Signup.where(username: username)
        if Signup.find_by(username: username) 
            Signup.all.select do |signup|
                if signup.username == username
                    puts "\n"
                    puts "\n"
                    puts signup.class_name
                    puts "\n"
                    puts "\n"
                end
            end
            self.my_stuff(username)
            puts "cheese"
        else 
            puts "You have no classes"
        end
    end

    def self.user_info(username)
        puts User.find_by(username: username).username
        my_stuff(username)
    end

    def self.new_signup(event, username)
        Signup.create(class_name: event, username: username)
    end

    def self.chosing_event(username)
        puts "Wich class would you like to join?"
            
        input = gets.chomp.downcase
        if input == "yoga"
            new_signup("yoga", username)
        else input == "Swim class"
            new_signup("Swim class", username)
        end
        puts "You are now signed up for an event"
        my_stuff(username)
    end

    def self.my_stuff(username)
        puts "Would you like to view your classes or your profile."
        puts "Type 1, 2, 3, 4 or 5"
        puts "1. your profile"
        puts "2. list events"
        puts "3. delete profile"
        puts "4. update profile"
        puts "5. exit"
        input = gets.chomp.downcase
        if input == "1"
            user_info(username)
        elsif input == "2"
            user_classes(username)
            # puts does_user_have_classes(username)
            # puts "Would you like to join any classes? Type yes or no"
            # input2 = gets.chomp.downcase
            #     if input2 == "yes"
            #         Event.all.each do |event|
            #             puts event.name
            #         end
            #         chosing_event(username)
            #     end
        elsif input == "3"
            username = User.find_by(username: username)
                username.destroy
            puts "Your account is deleted, thank you for giving us your money for so long you..."
        elsif input == "4"
            puts "What would you like your new username to be?"
                new_name = gets.chomp
                User.update(username: new_name)
                    puts "Your new username is '#{new_name}'."
            my_stuff(new_name)
        elsif input == "5"
            puts "Goodbyeeeeeee!"
        else
            puts "What?"
            self.my_stuff(username)
        end
    end

    def self.event_list(username)
        puts "Do you wish to see all the classes you are in or view your profile? Type yes or no."
        input = gets.chomp.downcase
        if input == "yes"
            my_stuff(username)
        elsif input == "no"
            event_list_new_signup(username)
        elsif input == "exit"
            puts "Byeeee!"
        else
            puts "What?"
            event_list(username)
        end 
    end

    def start
        puts "Hello! Welcome to our 24h! Are you a member?"
        run_file
    end
    def run_file
        puts "type yes or no"
        input = gets.chomp.downcase
        if input == "yes"
            User.get_user
        elsif input == "no"
            User.new_user
        elsif input == "exit"
            puts "See you next time!"
        else
            puts "Say again?? Type yes or no. If you wish to leave type exit" 
            run_file
        end
    end

    def self.event_list_new_signup(username)
        puts "Would you like to sign-up for classes?"
            input2 = gets.chomp.downcase
        if input2 == "yes"
            Event.all.each do |event|
                puts event.name
            end
            chosing_event(username)
        elsif input2 == "no"
            puts "Goodbyeeeeeee!"
        else 
            puts "What?"
            event_list_new_signup(username)
        end  
    end

    def self.user_classes(username)
        puts does_user_have_classes(username)
        puts "Would you like to join any classes? Type yes or no"
        input2 = gets.chomp.downcase
            if input2 == "yes"
                Event.all.each do |event|
                puts event.name
            end
        chosing_event(username)
        end
    end
end