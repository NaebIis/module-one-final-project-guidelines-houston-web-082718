require 'require_all'
require_all 'app'
require_relative "../config/environment.rb"

#-----Test user please do not move
test_user = User.create(username: "Testing")
#-------------------------------------------------------------------


#----User Seeds

bob = User.create(username: "mob")
mike = User.create(username: "mike")
trung = User.create(username: "trung")
john = User.create(username: "john")

#----Classes Seeds
yoga = Event.create(name: "Yoga Class", slots: 20, location: "room 1")
spinning = Event.create(name: "Spinning Class", slots: 20, location: "room 2")
swimming = Event.create(name: "Swimming Class", slots: 20, location: "room 3")
kickboxing = Event.create(name: "Kickboxing Class", slots: 20, location: "room 4")
pilate = Event.create(name: "Pilate Class", slots: 20, location: "room 5")

