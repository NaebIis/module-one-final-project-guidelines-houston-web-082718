class User < ActiveRecord::Base
  has_many :signup
  has_many :events, through: :signup


  def self.new_user
    puts ""
    puts "\s" * 5 + "Type your new username"
    print "\s" * 5
    username = gets.chomp.downcase
    User.create(username: username)
    # puts "Your username is #{username}"
    # status = "get_user"
    pass(username)
  end

  def self.not_a_member
    puts "\s" * 5 + "You are not a member!"
    puts "\s" * 5 + "would you like to join our gym?"
    print "\s" * 5
    input = gets.chomp.downcase
    if input == "yes"
      puts "\s" * 5 + 'What do you want your username to be?'
      print "\s" * 5
      name = gets.chomp.downcase
      User.create(username: name)
      puts ""
      puts "\s" * 5 + "OK! We got you, #{name}!\n"
      # status = "get_user"
      User.pass(name)
    else
      input == "no"
      status = "exit"
    end
  end

  def self.pass(username)
    puts ""
    puts "\s" * 5 + "Hello #{username}."
    username
  end

  def type_username_again
    puts ""
    puts "\s" * 5 + "Please type your username again to verify"
    username = gets.chomp
    if User.find_by(username: username)
      username
    else
      puts ""
      puts "\s" * 5 + "Error: Username does not match"
      status = "my_stuff"
    end
  end

  def self.get_user
    puts ""
    puts "\s" * 5 + "Please type your username"
    print "\s" * 5
    username = gets.chomp
    if User.find_by(username: username)
      puts ""
      puts "\s" * 5 + "Hello #{username}. Welcome to our gym!\n"
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
