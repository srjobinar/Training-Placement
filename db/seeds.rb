# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Branch.create(name: "Computer Science", code: "CS" , user_id: 1 )
Branch.create(name: "Electronics and Communication", code: "EC" , user_id: 2 )
Branch.create(name: "Electrical and Electronics", code: "EE" , user_id: 3 )
Branch.create(name: "Mechanical", code: "ME" , user_id: 4 )
Branch.create(name: "Civil", code: "CE" , user_id: 5 )
Branch.create(name: "Production", code: "PE" , user_id: 6 )
Branch.create(name: "Chemical", code: "CH" , user_id: 7 )
Branch.create(name: "Bio Technology", code: "BT" , user_id: 8 )
Branch.create(name: "Architecture", code: "AR" , user_id: 9 )


(1..10).each do |i|
  c = Company.create(name: "COMP_#{i}")
  (1..3).each do
    c.branches << Branch.offset(rand(8)).first
  end
end

(1..30).each do |u|
  offset = rand(Branch.count)
  rand_record = Branch.offset(offset).first
  User.create(name: "User_#{u}", email: "mail_#{u}@tnp.com", roll: ("B130" + (452 + u).to_s + rand_record.code), password: "pass_#{u}", cgpa: (5 + u%10), phone: "9496120742", branch_id: rand_record.id )
end
