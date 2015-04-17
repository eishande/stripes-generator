# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "nibbler@planetexpress.com", password: "futurama", password_confirmation: "futurama")

Dataset.create!(user_id: 1, name: "Test Temps", data: [45, 43, 22, 12, 22, 34, 34, 21, 14, 16])
Pattern.create!(user_id: 1, dataset_id: 1,
                colors: ["#5C323E",
                         "#A82743",
                         "#E15E32",
                         "#C0D23E",
                         "#E5F04C"])
