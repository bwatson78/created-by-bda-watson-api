# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
summary = <<-END
Brad D.A. Watson is a Full-Stack Web Developer, focused on the Ruby on Rails and React/Redux frameworks.

His professional experience (a year and a half) encompasses the front- and back-end of Ruby on Rails. Brad has utilized vanilla Javascript, jQuery, AJAX, HTML5/CSS3, CRON, and ERB while working on Leland Management's client-facing and administrative sites. During his stint at BioIQ, he worked remotely as a Software Support Engineer, debugging and programming the back-end automation of patients' email notifications and clients' report delivery. All of the previously mentioned languages, plus HAML, Ruport, and CSV were used daily by Brad at BioIQ.

When not soaking in the radiation rays from a computer monitor, Brad geeks out on all things cinema. His collection of movie posters and soundtracks grows monthly.
END

User.find_or_create_by(
  email: ENV['BRADS_EMAIL'],
  password: ENV['BRADS_DEFAULT_PASSWORD'],
  admin: true,
  summary: summary
)
