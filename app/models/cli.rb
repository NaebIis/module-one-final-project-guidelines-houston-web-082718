class Cli
  # attr_accessor :user_classes
  def call
    status           = 'start'
    current_username = nil
    while true
      if current_username
        case status
        when 'get_user'
          status = 'event_list'
        when 'event_list'
          status = Cli.event_list(current_username)
        when 'new_user'
          status = User.new_user(current_username)
        when 'my_stuff'
          status = Cli.my_stuff(current_username)
        when 'event_list_new_signup'
          status = Cli.event_list_new_signup(current_username)
        when 'user_info'
          status = Cli.user_info(current_username)
          # binding.pry
        when 'type_username_again'
          # binding.pry
          current_username = User.type_username_again
          status           = 'my_stuff'
        when 'user_classes'
          status = Cli.user_classes(current_username)
        when 'chosing_event'
          status = Cli.chosing_event(current_username)
        when 'delete'
          status = Cli.delete(current_username)
        when 'new_username'
          current_username = Cli.new_username(current_username)
          status           = 'my_stuff'
        when 'event_list_new_signup'
          status = Cli.event_list_new_signup(current_username)
        when 'list_all_events'
          status = Cli.list_all_events
        when 'exit'
          puts ' '
          puts "\s" * 5 + 'See you next time!'
          puts "#{"\s" * 5} #{"*" * 20 }  GOODBYE!  #{"*" * 20}"
          break
        end
      else
        case status
        when 'start'
          status = start
        when 'run_file'
          status = run_file
        when 'get_user'
          if current_username = User.get_user
            status = 'event_list'
          else
            #binding.pry
            status = 'not_a_member'
          end
        when 'my_stuff'
          current_username = User.get_user
          status           = 'my_stuff'
        when 'new_username'
          current_username = Cli.new_username
          status           = 'my_stuff'
        when 'new_user'
          current_username = User.new_user
          status           = 'my_stuff'
        when 'not_a_member'
          # status = User.not_a_member
          current_username = User.not_a_member
          status           = 'my_stuff'
        when 'list_all_events'
          status = Cli.list_all_events
        when 'exit'
          puts ' '
          puts "\s" * 5 + 'See you next time!'
          puts "#{"\s" * 5} #{"*" * 20 }  GOODBYE!  #{"*" * 20}"
          break
        end
      end
      if status == 'exit'
        puts ' '
        puts "\s" * 5 + 'See you next time!'
        puts "#{"\s" * 5} #{"*" * 20 }  GOODBYE!  #{"*" * 20}"
        break
      end
    end
  end

  def start
    puts `clear`
    message         = "WELCOME TO OUR FUNKY GYM"
    l               = message.length
    number_of_stars = 80
    puts "\n\n"
    puts "*" * number_of_stars
    puts "*" + "\s" * (number_of_stars - 2) + "*"
    puts "*" + "\s" * ((number_of_stars - 2 - l) / 2) + message + "\s" * ((number_of_stars - 2 - l) / 2) + "*"
    puts "*" + "\s" * (number_of_stars - 2) + "*"
    puts "*" * number_of_stars
    puts "\n\n"
    status = 'run_file'
  end

  def run_file
    puts "\s" * 5 + "Are you a member of our gym? (yes/no)"
    print "\s" * 5
    input = gets.chomp.downcase
    if input == 'yes'
      status = 'get_user'
    elsif input == 'no'
      status = 'new_user'
    elsif input == 'exit'
      status = 'exit'
    else
      puts "\s" * 5 + 'Say again?? Type yes or no. If you wish to leave type exit'
      status = 'run_file'
    end
  end

  def self.event_list(username)
    puts "\s" * 5 + 'Do you wish go to the menu options? Type yes or no.'
    print "\s" * 5
    input = gets.chomp.downcase
    if input == 'yes'
      status = 'my_stuff'
    elsif input == 'no'
      status = 'event_list_new_signup'
    elsif input == 'exit'
      status = 'exit'
    else
      puts "\s" * 5 + "What??? I didn't get that, #{username.capitalize}!"
      status = 'event_list'
    end
  end

  def self.my_stuff(username)
    puts `clear`
    message         = "OUR FUNKY GYM MENU"
    l               = message.length
    number_of_stars = 80
    puts "\n\n"
    puts "*" * number_of_stars
    puts "*" + "\s" * (number_of_stars - 2) + "*"
    puts "*" + "\s" * ((number_of_stars - 2 - l) / 2) + message + "\s" * ((number_of_stars - 2 - l) / 2) + "*"
    puts "*" + "\s" * (number_of_stars - 2) + "*"
    puts "*" * number_of_stars
    puts "\n\n"
    space = "\s" * 5
    puts space
    puts space + "Hello #{username.capitalize}! Select option that you want to do:"
    puts space + '_' * 50
    puts space
    puts space + '1. Your profile'
    puts space + '2. List of your classes'
    puts space + '3. Update your profile'
    puts space + '4. Delete your profile'
    puts space + '5. Sign-up for classes'

    puts space + '6. List ALL classes'
    puts space + "7. Exit\n"
    puts space + '_' * 50
    print space + 'Please type 1, 2, 3, 4 or 5: '
    input = gets.chomp.downcase
    if input == '1'
      status = 'user_info'
    elsif input == '2'
      status = 'user_classes'
    elsif input == '4'
      status = 'delete'
    elsif input == '3'
      status = 'new_username'
    elsif input == '5'
      status = 'event_list_new_signup'
    elsif input == '6'
      status = 'list_all_events'
    elsif input == '7'
      status = 'exit'


    else
      puts "\n"
      puts "\s" * 5 + "What? What? What? What did you say #{username.capitalize}?"
      puts "\n"
      print "\s" * 5 + "Press ENTER to go back to menu "
      gets
      status = 'my_stuff'
    end
  end

  def self.user_info(current_username)
    # binding.pry
    puts "\n"
    puts "\n"
    puts "#{"\s" * 5}Your username is #{current_username}"
    puts "\n"
    print "\s" * 5 + "Press ENTER to go back to menu "
    gets
    status = 'my_stuff'
  end

  def self.user_classes(username)
    puts ""
    if Signup.find_by(username: username)
      puts 'Here is the list of your classes:'
      puts "\n"
      i = 0
      Signup.all.each_with_index do |signup, index|
        if signup.username == username
          i += 1
          puts "\s" * 5 + "#{i}. #{signup.class_name.capitalize}"
        end
      end
      puts "\n"
      print "\s" * 5 + "Press ENTER to go back to menu "
      gets
      status = 'my_stuff'
    else
      puts "#{"\s" * 5}Sorry #{username.capitalize}! You have no classes"
      status = 'event_list_new_signup'
    end
  end


  def self.list_all_events
       puts "\n"
        puts "\s" * 5 + "Here is the list of our classes:"
        puts ""
        Event.all.each_with_index do |event, index|
          puts "\s" * 5 + " #{index + 1}. #{event.name}"
        end
       puts "\n"
       print "\s" * 5 + "Press ENTER to go back to menu "
       gets
       status = 'my_stuff'

  end

  def self.chosing_event(username)
    puts ""
    print "#{"\s" * 5}Which class would you like to join? "
    input = gets.chomp.downcase
    if input == 'yoga' || input == '1'
      new_signup('1. Yoga Class', username)
    elsif input == 'spinning' || input == '2'
      new_signup('2. Spinning Class', username)
    elsif input == 'swimming' || input == '3'
      new_signup('3. Swimming Class', username)
    elsif input == 'kickboxing' || input == '4'
      new_signup('4. Kickboxing Class', username)
    elsif input == 'pilate' || input == '5'
      new_signup('5. Pilate Class', username)
    else
      puts "\s" * 5 + "What are you trying to say, #{username.capitalize}?"
      puts "\s" * 5 + "Just type class name or oder number"
      status = 'chosing_event'
    end
    puts "\n"
    puts "#{"\s" * 5}You are now signed up for a class number: #{input.capitalize}"
    puts "\n"
    print "\s" * 5 + "Press ENTER to go back to menu "
    gets
    status = 'my_stuff'
  end

  def self.delete(username)
    user = User.find_by(username: username)
    user.destroy
    puts "\s" * 5
    puts "#{"\s" * 5} Your account is deleted #{username.capitalize}!"
    puts "#{"\s" * 5} Thank you for giving us your money for so long you...\n"
    status = 'exit'
  end


  def self.new_signup(event, username)
    Signup.create(class_name: event, username: username)
  end

  def self.event_list_new_signup(username)
    puts ""
    puts "#{"\s" * 5}Would you like to sign-up for classes? (yes/no)\n"
    print "\s" * 5
    input2 = gets.chomp.downcase
    if input2 == 'yes'
      puts "\n"
      puts "\s" * 5 + "Here is the list of classes:"
      puts ""
      Event.all.each_with_index do |event, index|
        puts "\s" * 5 + " #{index + 1}. #{event.name}"
      end
      puts "\n"
      status = 'chosing_event'
    elsif input2 == 'no'
      puts ""
      print "\s" * 5 + "Press ENTER to go back to menu "
      gets
      status = 'my_stuff'
    else
      puts "#{"\s" * 5}What? What?? I didn't catch that!"
      status = 'event_list_new_signup'
    end
  end


  def self.new_username(username)
    puts "#{"\s" * 5}What would you like your new username to be?"
    print "#{"\s" * 5}"
    new_name = gets.chomp
    # User.update(username: new_name)
    user          = User.find_by(username: username)
    user.username = new_name
    user.save
    puts "\n"
    puts "#{"\s" * 5}" + "Our system has updated your new username: '#{new_name}'."
    puts "\n"
    print "\s" * 5 + "Press ENTER to go back to menu "
    gets
    new_name
    # binding.pry
  end
end
