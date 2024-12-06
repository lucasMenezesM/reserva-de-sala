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

buildings = Building.create([
  {name: "A"},
  {name: "B"},
  {name: "C"},
  {name: "D"},
  {name: "E"}
])

floors = Floor.create([
  {name: "Ground"},
  {name: "First"},
  {name: "Second"},
  {name: "Third"},
  {name: "Fourth"}
])

rooms = Room.create([
  {name: "A101", floor: floors[1], building: buildings[0], capacity: 30},
  {name: "A102", floor: floors[1], building: buildings[0], capacity: 25},
  {name: "A103", floor: floors[1], building: buildings[0], capacity: 30},
  {name: "A104", floor: floors[1], building: buildings[0], capacity: 35},

  {name: "A201", floor: floors[2], building: buildings[0], capacity: 25},
  {name: "A202", floor: floors[2], building: buildings[0], capacity: 15},
  {name: "A203", floor: floors[2], building: buildings[0], capacity: 30},
  {name: "A204", floor: floors[2], building: buildings[0], capacity: 40},
  
  {name: "B101", floor: floors[1], building: buildings[1], capacity: 25},
  {name: "B102", floor: floors[1], building: buildings[1], capacity: 20},
  {name: "B103", floor: floors[1], building: buildings[1], capacity: 20},

  {name: "B201", floor: floors[2], building: buildings[1], capacity: 15},
  {name: "B201", floor: floors[2], building: buildings[1], capacity: 25},
  {name: "B201", floor: floors[2], building: buildings[1], capacity: 35},

  {name: "C301", floor: floors[3], building: buildings[2], capacity: 25},
  {name: "C302", floor: floors[3], building: buildings[2], capacity: 15},
  {name: "C303", floor: floors[3], building: buildings[2], capacity: 20},

  {name: "D401", floor: floors[4], building: buildings[3], capacity: 35},
  {name: "D402", floor: floors[4], building: buildings[3], capacity: 35},
  {name: "D403", floor: floors[4], building: buildings[3], capacity: 35},

  {name: "E101", floor: floors[1], building: buildings[4], capacity: 40},
  {name: "E102", floor: floors[1], building: buildings[4], capacity: 30},
  {name: "E103", floor: floors[1], building: buildings[4], capacity: 20},

  {name: "A001", floor: floors[0], building: buildings[0], capacity: 25},
  {name: "A002", floor: floors[0], building: buildings[0], capacity: 15},
  {name: "A003", floor: floors[0], building: buildings[0], capacity: 35},

  {name: "D001", floor: floors[0], building: buildings[3], capacity: 20},
  {name: "D002", floor: floors[0], building: buildings[3], capacity: 30},
  {name: "D003", floor: floors[0], building: buildings[3], capacity: 30},
])

users = User.create([
  {name: "lucas", email: "lucas@gmail.com", password: "password", profile: "admin"},
  {name: "maria", email: "maria@gmail.com", password: "password", profile: "user"},
  {name: "john", email: "john@gmail.com", password: "password", profile: "user"},
  {name: "anna", email: "anna@gmail.com", password: "password", profile: "user"},
  {name: "paul", email: "paul@gmail.com", password: "password", profile: "user"},
  {name: "lisa", email: "lisa@gmail.com", password: "password", profile: "user"}
])

reservations = Reservation.create([
  {user: users[0], room: rooms[0], date: "2024-11-27", time: "10:00:00"},
  {user: users[0], room: rooms[1], date: "2024-11-28", time: "12:00:00"},
  {user: users[0], room: rooms[3], date: "2024-11-28", time: "16:00:00"},
  {user: users[0], room: rooms[5], date: "2024-11-29", time: "15:30:00"},

  {user: users[1], room: rooms[5], date: "2024-11-30", time: "17:30:00"},
  {user: users[2], room: rooms[5], date: "2024-11-30", time: "15:30:00"},
  {user: users[2], room: rooms[24], date: "2024-11-29", time: "09:30:00"},
  {user: users[3], room: rooms[22], date: "2024-11-30", time: "09:30:00"},

  {user: users[5], room: rooms[10], date: "2024-12-27", time: "10:00:00"},
  {user: users[5], room: rooms[11], date: "2024-12-28", time: "12:00:00"},
  {user: users[4], room: rooms[13], date: "2024-12-28", time: "16:00:00"},
  {user: users[4], room: rooms[17], date: "2024-12-29", time: "15:30:00"},

  {user: users[5], room: rooms[21], date: "2024-12-30", time: "17:30:00"},
  {user: users[4], room: rooms[15], date: "2024-12-30", time: "15:30:00"},
  {user: users[2], room: rooms[14], date: "2024-12-29", time: "09:30:00"},
  {user: users[3], room: rooms[20], date: "2024-12-30", time: "09:30:00"}
])