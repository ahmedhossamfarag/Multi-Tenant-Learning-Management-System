# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Schema.public
User.create(name: "public admin", email: "ahmed.admin@gmail.com", role: :admin, password: "password", password_confirmation: "password")
Schema.open "guc"
User.create(name: "guc admin", email: "ahmed.admin@gmail.com", role: :admin, password: "password", password_confirmation: "password")
Schema.open "giu"
User.create(name: "giu admin", email: "ahmed.admin@gmail.com", role: :admin, password: "password", password_confirmation: "password")
