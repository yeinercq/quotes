coopkahawa = Company.create(name: "Coopkahawa")
cadefihuila = Company.create(name: "Cadefihuila")

puts "Companies has been created"

User.create(email: "cristina@coopkahawa.com", password: "123456", password_confirmation: "123456", company: coopkahawa)
User.create(email: "yeiner@coopkahawa.com", password: "123456", password_confirmation: "123456", company: coopkahawa)
User.create(email: "gilberto@cadefihuila.com", password: "123456", password_confirmation: "123456", company: cadefihuila)

puts "Users has been created"

for i in (1..5) do
  Quote.create(name: "Quote #{i}", company: coopkahawa)
end

puts "Quotes has been created"

quote = Quote.first
quote.line_item_dates.create!(date: Date.today)
quote.line_item_dates.create!(date: Date.today + 5.days)

puts "Dates has been created"
