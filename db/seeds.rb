# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


perpetrator_detail = PerpetratorDetail.create([
    {
        fullname: "Naufal Fadhil Athallah",
        nickname: "Fadhil",
        birthday: nil,
        deleted_at: nil
    },
])

report = Report.create([
    {
        user_id: 1,
        perpetrator_detail_id: 1,
        reason: "reason reason reason",
        proof: "LukaLebam.jpg",
        witness: "Teman",
        incident_location: "SMP NEGERI X",
        incident_date: "2022-06-22",
        status: "CHECKED",
        is_valid: false,
        deleted_at: nil
    },
])

users = User.create([
    { 
        name: "NoMobb Admin",
        email: "admin@nomobb.com",
        phone: "081234567891",
        password: "admin",
        is_verified: true,
        role: "ADMIN"
    },
    { 
        name: "Naufal Fadhil Athallah",
        email: "NaufalFadhil@google.com",
        phone: "081234567892",
        password: "NaufalFadhilPass",
        is_verified: true,
        role: "ADMIN"
    },
    {
        name: "Jake Alinsky",
        email: "jake.alinsky@gmail.com",
        phone: "081234567893",
        password: "Jakeyhey12",
        is_verified: false,
        role: "BASIC"
    },
    {
        name: "Siti Nurma",
        email: "sitinurma@gmail.com",
        phone: "081234567894",
        password: "SitiNurmaaa",
        is_verified: true,
        role: "PSIKOLOGIST"
    },
    {
        name: "Ihsan Ahsanu",
        email: "ihsan.ahsanu@gmail.com",
        phone: "081234567895",
        password: "IhsanAhsanu",
        is_verified: false,
        role: "BASIC"
    }
]);

api_access = ApiAccess.create([
    { 
        user_id: 1,
        token: "tIG79ybrcFPk07QtAb1u7u",
        expired_date: "2022-10-31"
    },
    { 
        user_id: 2,
        token: "1u7uPk07QtAtIG79ybrcFb",
        expired_date: "2022-12-31"
    },
    { 
        user_id: 3,
        token: "tIG79ybrcFb1u7uPQtAk07",
        expired_date: "2022-11-30"
    },
    { 
        user_id: 5,
        token: "tIG79b1u7uPkybrcF07QtA",
        expired_date: "2022-11-30"
    }
]);
