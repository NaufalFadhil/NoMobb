# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([
    { 
        name: "Naufal Fadhil Athallah",
        email: "NaufalFadhil@google.com",
        phone: "08123456789",
        password: "asdfghjkl",
        is_verified: true,
        role: "ADMIN"
    }
]);

api_access = ApiAccess.create([
    { 
        user_id: 1,
        token: "asdfghjklasdfghjkl",
        expired_date: "2022-07-01"
    }
]);