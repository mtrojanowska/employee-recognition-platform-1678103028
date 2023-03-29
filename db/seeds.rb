# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Kudo.delete_all
Employee.delete_all

employees = []

5.times do   
   employees << Employee.find_or_create_by!( email: Faker::Internet.email) do |employee|
      employee.password = 'dupablada'
      employee.encrypted_password = 'dupablada'
   end
end

employees.each do |employee|
  receiver_ids = employees.map(&:id) 
   2.times do      
         kudo = Kudo.new(title: Faker::Book.title,
            content: Faker::Lorem.paragraph(sentence_count: 5),
            giver_id: employee.id,            
            receiver_id: receiver_ids.sample )
            kudo.giver_id != kudo.receiver.id
            kudo.save            
   end 
end
   





   

   
    
