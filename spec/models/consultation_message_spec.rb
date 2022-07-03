require 'rails_helper'

RSpec.describe ConsultationMessage, type: :model do
  it 'is valid with full input field' do
    user = FactoryBot.create(:user)
    message = FactoryBot.build(:consultation_message)

    message.valid?
    expect(message).to be_valid
  end

  it 'is invalid without sender field' do
    user = FactoryBot.create(:user)
    message = FactoryBot.build(:consultation_message, sender: nil)

    message.valid?
    expect(message).to be_invalid
  end

  it 'is invalid with non numeric sender field' do
    user = FactoryBot.create(:user)
    message = FactoryBot.build(:consultation_message, sender: "satu")

    message.valid?
    expect(message).to be_invalid
  end

  it 'is valid without message field' do
    user = FactoryBot.create(:user)
    message = FactoryBot.build(:consultation_message, message: nil)

    message.valid?
    expect(message.errors[:message]).to include("can't be blank")
  end

  it 'is invalid without receiver field' do
    user = FactoryBot.create(:user)
    message = FactoryBot.build(:consultation_message, receiver: nil)

    message.valid?
    expect(message).to be_invalid
  end

  it 'is invalid with non numeric receiver field' do
    user = FactoryBot.create(:user)
    message = FactoryBot.build(:consultation_message, receiver: "satu")

    message.valid?
    expect(message).to be_invalid
  end
end
