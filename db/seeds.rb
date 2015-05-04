# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.where(email: 'nibbler@planetexpress.com').first_or_initialize.tap do |u|
  u.password = 'castagenius'
end

temps_dataset = Dataset.create!(user: user, name: "Temperature Sample", data: "42,45,48,40,31,25,27,27,24,19,21,37,46,41,42,38,46,26,28,24,22,45,48,44,50,58,51,60,67,52,71,52,50,52,43,67,57,60,66,67,61,69,75,80,72,76,77,69,68,80,63,89,64,69")
Pattern.create!(user: user, dataset: temps_dataset,
                colors: ["#d7191c",
                         "#fdae61",
                         "#ffffbf",
                         "#a6d96a",
                         "#1a9641"])

steps_dataset = Dataset.create!(user: user, name: "Steps Per Day Sample", data: "7397,5403,7848,5003,8187,9347,8533,7922,8431,7878,9191,5016,6903,9215,6178,7361,7642,5603,7939,8877,9523,5810,5775,7490,6759,6927,5752,9250,5003,8573,7902,9416,8355,9085,7589,5552,9408,7028,9125,8531,9716,9688,6922,6775,7891,7213,6737,5312,8980,9457")
Pattern.create!(user: user, dataset: steps_dataset,
                 colors: ["#1b9e77",
                          "#d95f02",
                          "#7570b3",
                          "#e7298a",
                          "#66a61e"])

snow_dataset = Dataset.create!(user: user, name: "Snowfall Sample", data: "52,63,89,82,25,20,33,58,95,91,16,108,97,81,48,46,14,110,34,67,79,90,66,67,19,13,105,60,77,74")
Pattern.create!(user: user, dataset: snow_dataset,
                colors: ["#ffffcc",
                         "#c2e699",
                         "#78c679",
                         "#31a354",
                         "#006837"])
