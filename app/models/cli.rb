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
        when 'menu_options'
          status = Cli.menu_options(current_username)
        when 'event_list_new_signup'
          status = Cli.event_list_new_signup(current_username)
        when 'user_info'
          status = Cli.user_info(current_username)
          # binding.pry
        when 'type_username_again'
          # binding.pry
          current_username = User.type_username_again
          status           = 'menu_options'
        when 'user_classes'
          status = Cli.user_classes(current_username)
        when 'chosing_event'
          status = Cli.chosing_event(current_username)
        when 'delete'
          status = Cli.delete(current_username)
        when 'new_username'
          current_username = Cli.new_username(current_username)
          status           = 'menu_options'
        when 'event_list_new_signup'
          status = Cli.event_list_new_signup(current_username)
        when 'list_all_events'
          status = Cli.list_all_events
        when 'exit'
          puts ' '
          puts "\s" * 5 + 'See you next time!'
          puts "#{"\s" * 5} #{"*" * 20 }  GOODBYE!  #{"*" * 20}".colorize(:red)
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
            status = 'menu_options'
          else
            #binding.pry
            status = 'not_a_member'
          end
        when 'menu_options'
          current_username = User.get_user
          status           = 'menu_options'
        when 'new_username'
          current_username = Cli.new_username
          status           = 'menu_options'
        when 'new_user'
          current_username = User.new_user
          status           = 'menu_options'
        when 'not_a_member'
          # status = User.not_a_member
          current_username = User.not_a_member
          if current_username != "exit"
              status = 'menu_options'
          else
            status = "exit"
            end
        when 'list_all_events'
          status = Cli.list_all_events
        when 'exit'
          puts ' '
          puts "\s" * 5 + 'See you next time!'
          puts "#{"\s" * 5} #{"*" * 20 }  GOODBYE!  #{"*" * 20}".colorize(:red)
          break
        end
      end
      if status == 'exit'
        puts ' '
        puts "\s" * 5 + 'See you next time!'
        puts "#{"\s" * 5} #{"*" * 20 }  GOODBYE!  #{"*" * 20}".colorize(:red)
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
    puts "*".colorize(:red) * number_of_stars
    puts "*".colorize(:red) + "\s" * (number_of_stars - 2) + "*".colorize(:red)
    puts "*".colorize(:red) + "\s" * ((number_of_stars - 2 - l) / 2) + message.colorize(:yellow) + "\s" * ((number_of_stars - 2 - l) / 2) + "*".colorize(:red)
    puts "*".colorize(:red) + "\s" * (number_of_stars - 2) + "*". colorize(:red)
    puts "*".colorize(:red) * number_of_stars
    puts "\n\n"
    status = 'run_file'
  end

  def run_file
    puts "\s" * 5 + "Are you a member of Funky Gym?".colorize(:blue) + " (yes/no)"
    print "\s" * 5
    input = gets.chomp.downcase
    if input == 'yes'
      status = 'get_user'
    elsif input == 'no'
      status = 'new_user'
    elsif input == 'exit'
      status = 'exit'
    else
      puts ""
      puts "\s" * 5 + 'Type'.colorize(:blue)+ ' yes' +' or'.colorize(:blue) + ' no' + '. If you wish to leave type exit'.colorize(:blue)
      status = 'run_file'
    end
  end

  # def self.event_list(username)
  #   puts "\s" * 5 + 'Do you wish go to the menu options? Type yes or no.'
  #   print "\s" * 5
  #   input = gets.chomp.downcase
  #   if input == 'yes'
  #     status = 'menu_options'
  #   elsif input == 'no'
  #     status = 'event_list_new_signup'
  #   elsif input == 'exit'
  #     status = 'exit'
  #   else
  #     puts "\s" * 5 + "What??? I didn't get that, #{username.capitalize}!"
  #     status = 'event_list'
  #   end
  # end

  def self.menu_options(username)
    puts `clear`
    message         = "OUR FUNKY GYM MENU"
    l               = message.length
    number_of_stars = 80
    puts "\n\n"
    puts "*".colorize (:red) * number_of_stars
    puts "*".colorize(:red) + "\s" * (number_of_stars - 2) + "*".colorize(:red)
    puts "*".colorize(:red) + "\s" * ((number_of_stars - 2 - l) / 2) + message.colorize(:yellow) + "\s" * ((number_of_stars - 2 - l) / 2) + "*".colorize(:red)
    puts "*".colorize(:red) + "\s" * (number_of_stars - 2) + "*".colorize(:red)
    puts "*".colorize(:red) * number_of_stars
    puts "\n\n"
    space = "\s" * 5
    puts space
    puts space + "Hello".colorize(:blue) + " #{username.capitalize}".colorize(:yellow) + "! Select option that you want to do:".colorize(:blue)
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
      puts "\s" * 5 + "#{random_fun_responds}" + " #{username.capitalize}".colorize(:yellow) + "?".colorize(:red)
      puts "\n"
      print "\s" * 5 + "Press ENTER to go back to menu "
      gets
      status = 'menu_options'
    end
  end

  def self.user_info(current_username)
    # binding.pry
    puts "\n"
    puts "\n"
    puts "#{"\s" * 5}Your username is ".colorize(:blue) + " #{current_username}".colorize(:yellow)
    puts "\n"
    print "\s" * 5 + "Press ENTER to go back to menu "
    gets
    status = 'menu_options'
  end

  def self.user_classes(username)
    puts ""
    if Signup.find_by(username: username)
      puts "\s" * 5 + 'Here is the list of your classes:'.colorize(:blue)
      puts "\n"
      i = 0
      Signup.all.each do |signup|
        if signup.username == username
          i += 1
          puts "\s" * 5 + "#{i}. #{signup.class_name.capitalize}"
        end
      end
      puts "\n"
      print "\s" * 5 + "Press ENTER to go back to menu "
      gets
      status = 'menu_options'
    else
      puts "#{"\s" * 5}Sorry".colorize(:blue) + " #{username.capitalize}".colorize(:yellow) + "! You have no classes".colorize(:blue)
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
       status = 'menu_options'

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
      puts "\s"
      random_fun_responds
      puts "\s" * 5 + "Just type class name or oder number"
      status = 'chosing_event'
    end
    puts "\n"
    puts "#{"\s" * 5}You are now signed up for a class number:" + " #{input.capitalize}".colorize(:blue)
    puts "\n"
    print "\s" * 5 + "Press ENTER to go back to menu "
    gets
    status = 'menu_options'
  end

  def self.delete(username)
    user = User.find_by(username: username)
    user.destroy
    puts "\s" * 5
    puts "#{"\s" * 5} Your account is deleted #{username.capitalize}!".colorize(:red)
    puts "#{"\s" * 5} Thank you for giving us your money for so long you...\n".colorize(:blue)
    status = 'exit'
  end


  def self.new_signup(event, username)
    Signup.create(class_name: event, username: username)
  end

  def self.event_list_new_signup(username)
    puts ""
    puts "#{"\s" * 5}Would you like to sign-up for classes? (yes/no)\n".colorize(:blue)
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
      status = 'menu_options'
    else
      puts ''
      random_fun_responds
      status = 'event_list_new_signup'
    end
  end


  def self.new_username(username)
    puts "#{"\s" * 5}What would you like your new username to be?".colorize(:blue)
    print "#{"\s" * 5}"
    new_name = gets.chomp
    # User.update(username: new_name)
    user          = User.find_by(username: username)
    user.username = new_name
    user.save
    puts "\n"
    puts "#{"\s" * 5}" + "Our system has updated your new username:" + " '#{new_name}'.".colorize(:blue)
    puts "\n"
    print "\s" * 5 + "Press ENTER to go back to menu "
    gets
    new_name
    # binding.pry
  end

  def self.random_fun_responds
    responds = [
      "#{"\s" * 5}What's the heck? I don't understanding a word you said",
      "#{"\s" * 5}Ehh? What did you said again?",
      "#{"\s" * 5}Sorry! Please type again.",
      "#{"\s" * 5}Oh, man! You're making me crazy!",
      "#{"\s" * 5}OMG! Do you know how to type a word?",
      "#{"\s" * 5}Damn! You are genius! ...but I don't understand.",
      "#{"\s" * 5}What the heck is that! Common, I don't have all day!"

    ]
    responds.sample.to_s.colorize(:red)
  end
end
