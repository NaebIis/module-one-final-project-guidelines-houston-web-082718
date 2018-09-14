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
yoga = Event.create(name: "Yoga Class")
spinning = Event.create(name: "Spinning Class")
swimming = Event.create(name: "Swimming Class")
kickboxing = Event.create(name: "Kickboxing Class")
pilate = Event.create(name: "Pilate Class")

