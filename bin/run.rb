require_relative '../config/environment'


# binding.pry
puts "Hello! Welcome to our 24h! Are you a member?"
puts "type yes or no"
#binding.pry
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

def my_classes(username)
    Signup.find_by(username: username).class_name

end

def event_list(username)
    puts "Do you wish to see all the classes you are in? Type yes or no."
    input = gets.chomp.downcase
    if input == "yes"
        puts my_classes(username)
    else 
        Event.all.each do |event|
        puts event.name
        end
        chosing_event(username)
    end
end

def run_file
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



# def pick_class



# end

    run_file