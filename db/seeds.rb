User.create! name: "Admin dz",
            email: "mabugay1234@gmail.com",
            password: "123456",
            password_confirmation: "123456",
            admin: true

User.create! name: "test",
            email: "mabugay@gmail.com",
            password: "123456",
            password_confirmation: "123456",
            admin: false

10.times do |n|
  name  = Faker::Name.name
  email = "mabugay1234-#{n+1}@gmail.com"
  password = "123456"
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password
end

Room.create! name: "PM1",
            size: "30",
            kind: "Thuc hanh",
            status: true

Room.create! name: "PM2",
            size: "35",
            kind: "Thuc hanh",
            status: true

Room.create! name: "PM3",
            size: "28",
            kind: "Thuc hanh",
            status: true

Room.create! name: "PM4",
            size: "31",
            kind: "Thuyet trinh",
            status: true

Form.create! user_id: "1",
              room_id: "1",
              time_id: "1",
              intent: "Thuc hanh"

TimeSheet.create room_id: 1, time: Time.zone.parse("2019-03-06 07:00:00")
TimeSheet.create room_id: 1, time: Time.zone.parse("2019-03-06 09:30:00")
TimeSheet.create room_id: 1, time: Time.zone.parse("2019-03-06 12:30:00")
TimeSheet.create room_id: 1, time: Time.zone.parse("2019-03-06 15:00:00")
TimeSheet.create room_id: 1, time: Time.zone.parse("2019-03-06 17:00:00")

TimeSheet.create room_id: 2, time: Time.zone.parse("2019-03-07 07:00:00")
TimeSheet.create room_id: 2, time: Time.zone.parse("2019-03-07 09:30:00")
TimeSheet.create room_id: 2, time: Time.zone.parse("2019-03-07 12:30:00")
TimeSheet.create room_id: 2, time: Time.zone.parse("2019-03-07 15:00:00")
TimeSheet.create room_id: 2, time: Time.zone.parse("2019-03-07 17:00:00")
