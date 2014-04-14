namespace :db do
    
    desc "Fill database with sample data"
    task populate: :environment do
        
        admin = User.create!(
                            name: "Admin User",
                            email: "test@test.com",
                            password: "testes",
                            password_confirmation: "testes",
                            admin: true
            )
        
        User.create!(name: "Example User",
                email: "example@railsutorial.jp",
                password: "foobar",
                password_confirmation: "foobar")
        99.times do |n|
            name = Faker::Name.name
            email = "example-#{n+1}@railstutorial.jp"
            password = "password"
            User.create!(name:name,
                email: email,
                password: password,
                password_confirmation: password)
        end
    end
end