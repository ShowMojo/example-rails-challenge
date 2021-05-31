customers = [
  { firstname: 'Johny', lastname: 'Flow' },
  { firstname: 'Raj', lastname: 'Jamnis' },
  { firstname: 'Andrew', lastname: 'Chung' },
  { firstname: 'Mike', lastname: 'Smith' }
]

customers.each do |customer|
  c = Customer.create!(firstname: customer[:firstname], lastname: customer[:lastname])

  puts "\nCustomer #{c.id}:"
  puts "First Name: #{c.firstname}"
  puts "Last Name: #{c.lastname}"
end
