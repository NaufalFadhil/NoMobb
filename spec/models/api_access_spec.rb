require 'rails_helper'

RSpec.describe ApiAccess, type: :model do
  it 'is valid with all field' do
    user = User.create(
      name: "Naufal Fadhil Athallah",
      email: "NaufalFadhil@google.com",
      phone: "08123456789",
      password: "adfghjklmnbvcxz",
      is_verified: true,
      role: "ADMIN"
    )

    access = ApiAccess.create(
        user_id: 1,
        token: generate_token,
        expired_date: "2022-12-31"
    )

    expect(access).to be_valid
  end

  it 'is invalid without user' do
    access = ApiAccess.new(
        user_id: 100,
        token: generate_token,
        expired_date: "2022-12-31"
    )

    access.valid?
    expect(access.errors[:user]).to include("must exist")
  end

  it 'is invalid without a user id' do
    access = ApiAccess.new(
      user_id: nil,
      token: nil,
      expired_date: nil
    )

    access.valid?
    expect(access.errors[:user_id]).to include("can't be blank")
  end

  it 'is invalid without a token' do
    access = ApiAccess.new(
      user_id: nil,
      token: nil,
      expired_date: nil
    )

    access.valid?
    expect(access.errors[:token]).to include("can't be blank")
  end

  it 'is invalid without a expired_date' do
    access = ApiAccess.new(
      user_id: nil,
      token: nil,
      expired_date: nil
    )

    access.valid?
    expect(access.errors[:expired_date]).to include("can't be blank")
  end

  it 'is invalid with duplicate token' do
    user = User.create(
      name: "Naufal Fadhil Athallah",
      email: "NaufalFadhil@google.com",
      phone: "08123456789",
      password: "adfghjklmnbvcxz",
      is_verified: true,
      role: "ADMIN"
    )

    access = ApiAccess.create(
      user_id: 1,
      token: "abcde12345",
      expired_date: "2022-12-31"
    )

    access2 = ApiAccess.create(
      user_id: 1,
      token: "abcde12345",
      expired_date: "2022-12-31"
    )

    access2.valid?
    expect(access2.errors[:token]).to include("has already been taken")
  end

  it 'is valid with all field' do
    access = ApiAccess.create(
        user_id: 1,
        token: generate_token,
        expired_date: "2021-12-31"
    )

    expect(access.errors[:expired_date]).to include("can't be in the past")
  end
end

def generate_token
  token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless ApiAccess.exists?(token: random_token)
  end
end
