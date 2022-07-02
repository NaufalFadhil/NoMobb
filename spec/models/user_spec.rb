require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with all field' do
    user = User.new(
        name: "Naufal Fadhil Athallah",
        email: "NaufalFadhil@google.com",
        phone: "08123456789",
        password: "adfghjklmnbvcxz",
        is_verified: true,
        role: "ADMIN"
    )

    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(
      name: nil,
      email: nil,
      phone: nil,
      password: nil,
      is_verified: nil,
      role: nil
    )

    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a email' do
    user = User.new(
      name: nil,
      email: nil,
      phone: nil,
      password: nil,
      is_verified: nil,
      role: nil
    )

    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a phone' do
    user = User.new(
      name: nil,
      email: nil,
      phone: nil,
      password: nil,
      is_verified: nil,
      role: nil
    )

    user.valid?
    expect(user.errors[:phone]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = User.new(
      name: nil,
      email: nil,
      phone: nil,
      password: nil,
      is_verified: nil,
      role: nil
    )

    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid without a verified' do
    user = User.new(
      name: nil,
      email: nil,
      phone: nil,
      password: nil,
      is_verified: nil,
      role: nil
    )

    user.valid?
    expect(user.errors[:is_verified]).to include("is not included in the list")
  end

  it 'is invalid without a role' do
    user = User.new(
      name: nil,
      email: nil,
      phone: nil,
      password: nil,
      is_verified: nil,
      role: nil
    )

    user.valid?
    expect(user.errors[:role]).to include("can't be blank")
  end

  it 'is invalid with duplicate email' do
    user = User.create(
      name: "Naufal Fadhil Athallah",
      email: "NaufalFadhil@google.com",
      phone: "08123456789",
      password: "adfghjklmnbvcxz",
      is_verified: true,
      role: "ADMIN"
    )

    user2 = User.new(
      name: "Naufal Fadhil Athallah",
      email: "NaufalFadhil@google.com",
      phone: "08123456789",
      password: "adfghjklmnbvcxz",
      is_verified: true,
      role: "ADMIN"
    )

    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it 'is invalid with duplicate phone number' do
    user = User.create(
      name: "Naufal Fadhil Athallah",
      email: "NaufalFadhil@google.com",
      phone: "08123456789",
      password: "adfghjklmnbvcxz",
      is_verified: true,
      role: "ADMIN"
    )

    user2 = User.new(
      name: "Naufal Fadhil Athallah",
      email: "NaufalFadhil@google.com",
      phone: "08123456789",
      password: "adfghjklmnbvcxz",
      is_verified: true,
      role: "ADMIN"
    )

    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it 'is invalid with wrong email format' do
    user = User.new(
      name: "Naufal Fadhil Athallah",
      email: "NaufalFadhil@google",
      phone: "08123456789",
      password: "adfghjklmnbvcxz",
      is_verified: true,
      role: "ADMIN"
    )
    
    expect(user).to be_invalid
  end
end
