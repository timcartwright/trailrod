require 'csv'

case Rails.env
when 'production'
end

User.where(email: 'admin@teasea.uk').first_or_create! do |u|
  u.email = 'admin@teasea.uk'
  u.password = 'Cameje00'
  u.password_confirmation = 'Cameje00'
  u.admin = true
  u.skip_confirmation!
  u.save!
end

EventRegistration.destroy_all
Event.destroy_all
Trail.destroy_all

CSV.foreach("db/csv/trails.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  Trail.create!(row.to_hash)
end

# CSV.foreach("db/csv/events.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
#   Event.create!(row.to_hash)
# end