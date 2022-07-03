# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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


report = Report.create([
    {
        user_id: 1,
        perpetrator_fullname: "Naufal Fadhil Athallah",
        perpetrator_nickname: "Fadhil",
        perpetrator_birthday: "2001-01-01",
        reason: "Diinjak",
        proof: "https://drive.google.com",
        witness: "Teman Sekelas",
        incident_location: "SD NEGERI X",
        incident_date: "2022-06-22",
        status: "CHECKED",
        is_valid: true
    },
    {
        user_id: 2,
        perpetrator_fullname: "Andi Pranata Subakti",
        perpetrator_nickname: "Andi",
        perpetrator_birthday: "2000-01-01",
        reason: "Barangku diambil",
        proof: "https://drive.google.com",
        witness: "Udin",
        incident_location: "SMP NEGERI X",
        incident_date: "2020-05-02",
        status: "PENDING",
        is_valid: false
    },
    {
        user_id: 3,
        perpetrator_fullname: "Ihsan Ahsanu Amalai",
        perpetrator_nickname: "Ihsan",
        perpetrator_birthday: nil,
        reason: "Dipukul",
        proof: "https://drive.google.com",
        witness: "Asep",
        incident_location: "SMA NEGERI X",
        incident_date: "2021-02-22",
        status: "PENDING",
        is_valid: false
    },
])

consultation_message = ConsultationMessage.create([
    {
        roomchat_id: 1,
        sender: 1,
        message: "Haloo",
        receiver: 2
    },
    {
        roomchat_id: 1,
        sender: 1,
        message: "Halo juga",
        receiver: 2
    },
    {
        roomchat_id: 1,
        sender: 1,
        message: "Ada yang bisa saya bantu?",
        receiver: 2
    },
    {
        roomchat_id: 1,
        sender: 1,
        message: "Saya ingin berkonsultasi tentang pembulian yang terjadi",
        receiver: 2
    }
])

community = Community.create([
    { 
        sender: 1,
        title: "Minta saran terkait hal yang disekolah",
        message_preview: "Jadi begini aku mau cerita"
    },
    { 
        sender: 2,
        title: "Minta saran terkait hal yang dikantor",
        message_preview: "Jadi begini aku mau cerita"
    },
    { 
        sender: 3,
        title: "Minta saran terkait teman saya yang dibully",
        message_preview: "Jadi begini aku mau cerita"
    },
]);