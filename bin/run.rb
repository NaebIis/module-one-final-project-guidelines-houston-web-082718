require_relative '../config/environment'
#binding.pry

def does_user_have_classes(username)
    if Signup.find_by(username: username)
        Signup.find_by(username: username).class_name
    else
        puts "You have no classes"
    end
end

def user_info(username)
    User.find_by(username: username).username
end

def new_signup(event, username)
    Signup.create(class_name: event, username: username)
end

def chosing_event(username)
    puts "Type event you wish to join"
    input = gets.chomp.downcase
    if input == "yoga"
        new_signup("yoga", username)
    # elsif 
    end
end

def my_stuff(username)
    puts "Would you like to view your classes or your profile"
    puts "Type profile to view your profile and events for classes"
    input = gets.chomp.downcase
    if input == "profile"
        puts user_info(username)
    elsif input == "events"
        puts does_user_have_classes(username)
    else
        puts "What?"
    end

end

def event_list(username)
    puts "Do you wish to see all the classes you are in or view your profil? Type yes or no."
    input = gets.chomp.downcase
    if input == "yes"
        puts my_stuff(username)
    else 
        Event.all.each do |event|
        puts event.name
        end
        chosing_event(username)
    end
end

def run_file
    puts "Hello! Welcome to our 24h! Are you a member?"
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

run_file