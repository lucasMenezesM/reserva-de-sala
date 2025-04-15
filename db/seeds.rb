# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reservation.delete_all
User.delete_all
Room.delete_all
Floor.delete_all
Building.delete_all
Institution.delete_all

institutions = Institution.create!([
  {name: "Oxford", address: "Oxford Address test", contact: "Oxford contact test"},
  {name: "USP", address: "USP Address test", contact: "USP contact test"}
])

buildings = Building.create!([
  # First Institution
  {name: "A", institution: institutions[0]},
  {name: "B", institution: institutions[0]},
  {name: "C", institution: institutions[0]},
  {name: "D", institution: institutions[0]},
  {name: "E", institution: institutions[0]},

  # Second Institution
  {name: "Building A", institution: institutions[1]},
  {name: "Building B", institution: institutions[1]},
  {name: "Building C", institution: institutions[1]},
  {name: "Building D", institution: institutions[1]},
  {name: "Building E", institution: institutions[1]}
])

floors = Floor.create!([
  # First Institution
  {name: "Ground", institution: institutions[0]},
  {name: "First", institution: institutions[0]},
  {name: "Second", institution: institutions[0]},
  {name: "Third", institution: institutions[0]},
  {name: "Fourth", institution: institutions[0]},

  # Second Institution
  {name: "Ground", institution: institutions[1]},
  {name: "First", institution: institutions[1]},
  {name: "Second", institution: institutions[1]},
])

rooms = Room.create!([
  # First Institution
  {name: "A101", floor: floors[1], building: buildings[0], capacity: 30, institution: institutions[0]},
  {name: "A102", floor: floors[1], building: buildings[0], capacity: 25, institution: institutions[0]},
  {name: "A103", floor: floors[1], building: buildings[0], capacity: 30, institution: institutions[0]},
  {name: "A104", floor: floors[1], building: buildings[0], capacity: 35, institution: institutions[0]},

  {name: "A201", floor: floors[2], building: buildings[0], capacity: 25, institution: institutions[0]},
  {name: "A202", floor: floors[2], building: buildings[0], capacity: 15, institution: institutions[0]},
  {name: "A203", floor: floors[2], building: buildings[0], capacity: 30, institution: institutions[0]},
  {name: "A204", floor: floors[2], building: buildings[0], capacity: 40, institution: institutions[0]},
  
  {name: "B101", floor: floors[1], building: buildings[1], capacity: 25, institution: institutions[0]},
  {name: "B102", floor: floors[1], building: buildings[1], capacity: 20, institution: institutions[0]},
  {name: "B103", floor: floors[1], building: buildings[1], capacity: 20, institution: institutions[0]},

  {name: "B201", floor: floors[2], building: buildings[1], capacity: 15, institution: institutions[0]},
  {name: "B201", floor: floors[2], building: buildings[1], capacity: 25, institution: institutions[0]},
  {name: "B201", floor: floors[2], building: buildings[1], capacity: 35, institution: institutions[0]},

  {name: "C301", floor: floors[3], building: buildings[2], capacity: 25, institution: institutions[0]},
  {name: "C302", floor: floors[3], building: buildings[2], capacity: 15, institution: institutions[0]},
  {name: "C303", floor: floors[3], building: buildings[2], capacity: 20, institution: institutions[0]},

  {name: "D401", floor: floors[4], building: buildings[3], capacity: 35, institution: institutions[0]},
  {name: "D402", floor: floors[4], building: buildings[3], capacity: 35, institution: institutions[0]},
  {name: "D403", floor: floors[4], building: buildings[3], capacity: 35, institution: institutions[0]},

  {name: "E101", floor: floors[1], building: buildings[4], capacity: 40, institution: institutions[0]},
  {name: "E102", floor: floors[1], building: buildings[4], capacity: 30, institution: institutions[0]},
  {name: "E103", floor: floors[1], building: buildings[4], capacity: 20, institution: institutions[0]},

  {name: "A001", floor: floors[0], building: buildings[0], capacity: 25, institution: institutions[0]},
  {name: "A002", floor: floors[0], building: buildings[0], capacity: 15, institution: institutions[0]},
  {name: "A003", floor: floors[0], building: buildings[0], capacity: 35, institution: institutions[0]},

  {name: "D001", floor: floors[0], building: buildings[3], capacity: 20, institution: institutions[0]},
  {name: "D002", floor: floors[0], building: buildings[3], capacity: 30, institution: institutions[0]},
  {name: "D003", floor: floors[0], building: buildings[3], capacity: 30, institution: institutions[0]},

  # Second institution
  {name: "RA100", floor: floors[5], building: buildings[5], capacity: 30, institution: institutions[1]},
  {name: "RB201", floor: floors[6], building: buildings[6], capacity: 30, institution: institutions[1]},
  {name: "RC302", floor: floors[7], building: buildings[7], capacity: 30, institution: institutions[1]},
])

users = User.create!([
  {name: "lucas", email: "lucas@gmail.com", password: "password", profile: "admin", institution: nil},
  {name: "maria", email: "maria@gmail.com", password: "password", profile: "user", institution: nil},
  {name: "john", email: "john@gmail.com", password: "password", profile: "user", institution: nil},
  {name: "anna", email: "anna@gmail.com", password: "password", profile: "user", institution: nil},
  {name: "paul", email: "paul@gmail.com", password: "password", profile: "user", institution: nil},
  {name: "lisa", email: "lisa@gmail.com", password: "password", profile: "user", institution: nil}
])

reservations = Reservation.create!([
  # {user: users[0], room: rooms[0], date: "2024-11-27", time: "10:00:00", institution: institutions[0]},
  # {user: users[0], room: rooms[1], date: "2024-11-28", time: "12:00:00", institution: institutions[0]},
  # {user: users[0], room: rooms[3], date: "2024-11-28", time: "16:00:00", institution: institutions[0]},
  # {user: users[0], room: rooms[5], date: "2024-11-29", time: "15:30:00", institution: institutions[0]},

  # {user: users[1], room: rooms[5], date: "2024-11-30", time: "17:30:00", institution: institutions[0]},
  # {user: users[2], room: rooms[5], date: "2024-11-30", time: "15:30:00", institution: institutions[0]},
  # {user: users[2], room: rooms[24], date: "2024-11-29", time: "09:30:00", institution: institutions[0]},
  # {user: users[3], room: rooms[22], date: "2024-11-30", time: "09:30:00", institution: institutions[0]},

  # {user: users[5], room: rooms[10], date: "2024-12-27", time: "10:00:00", institution: institutions[0]},
  # {user: users[5], room: rooms[11], date: "2024-12-28", time: "12:00:00", institution: institutions[0]},
  # {user: users[4], room: rooms[13], date: "2024-12-28", time: "16:00:00", institution: institutions[0]},
  # {user: users[4], room: rooms[17], date: "2024-12-29", time: "15:30:00", institution: institutions[0]},

  # {user: users[5], room: rooms[21], date: "2024-12-30", time: "17:30:00", institution: institutions[0]},
  # {user: users[4], room: rooms[15], date: "2024-12-30", time: "15:30:00", institution: institutions[0]},
  # {user: users[2], room: rooms[14], date: "2024-12-29", time: "09:30:00", institution: institutions[0]},
  # {user: users[3], room: rooms[20], date: "2024-12-30", time: "09:30:00", institution: institutions[0]}
])