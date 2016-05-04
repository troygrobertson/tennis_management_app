namespace :db do

	desc "Fill database with sample data"

	task populate: :environment do

      puts "creating user"

      1.times do |n|
        name=Faker::Name.name
        email=Faker::Internet.email 
		password = "foobar"
        User.create!(:name => name, :email => email, :password => password, :password_confirmation => password)

      end


	end

	

end
