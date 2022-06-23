# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Report.create([
    {
        user_id: 1,
        perpetrator: "kakak kelas",
        reason: "reason reason reason",
        proof: "LukaLebam.jpg",
        witness: "Teman",
        incident_location: "SMP NEGERI X",
        incident_date: "2022-06-22",
        status: "CHECKED",
        is_valid: false,
        deleted_at: "2022-06-22"
    },
])

PerpetratorDetail.create([
    {
        fullname: "Naufal Fadhil Athallah",
        nickname: "Fadhil",
        birthday: nil,
        deleted_at: nil
    },
])