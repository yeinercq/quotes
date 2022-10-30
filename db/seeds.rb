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
l_1 = quote.line_item_dates.create(date: Date.today)
l_2 = quote.line_item_dates.create(date: Date.today + 5.days)

puts "Dates has been created"

LineItem.create(
  line_item_date: l_1,
  name: "Meeting room",
  description: "A cosy meeting room for 10 people",
  quantity: 1,
  unit_price: 1000
)

LineItem.create(
  line_item_date: l_1,
  name: "Meal tray",
  description: "Our delicious meal tray",
  quantity: 10,
  unit_price: 25
)

LineItem.create(
  line_item_date: l_2,
  name: "Meeting room",
  description: "A cosy meeting room for 10 people",
  quantity: 1,
  unit_price: 1000
)

LineItem.create(
  line_item_date: l_2,
  name: "Meal tray",
  description: "Our delicious meal tray",
  quantity: 10,
  unit_price: 25
)

puts "Line Items has been created"
