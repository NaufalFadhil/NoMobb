require 'rails_helper'

RSpec.describe Report, type: :model do
  it 'is valid with full input field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report)

    report.valid?
    expect(report).to be_valid
  end

  it 'is invalid without user_id field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, user_id: nil)
    
    report.valid?
    expect(report).to be_invalid
  end

  it 'is invalid without perpetrator fullname field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, perpetrator_fullname: nil)
    
    report.valid?
    expect(report.errors[:perpetrator_fullname]).to include("can't be blank")
  end

  it 'is invalid without perpetrator nickname field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, perpetrator_nickname: nil)
    
    report.valid?
    expect(report.errors[:perpetrator_nickname]).to include("can't be blank")
  end

  it 'is valid without perpetrator birthday field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, perpetrator_birthday: nil)

    report.valid?
    expect(report).to be_valid
  end
  
  it 'is invalid without proof field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, proof: nil)
    
    report.valid?
    expect(report).to be_invalid
  end
  
  it 'is invalid without url in proof field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, proof: "gambar.png")
    
    report.valid?
    expect(report).to be_invalid
  end

  it 'is invalid without witness field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, witness: nil)
    
    report.valid?
    expect(report.errors[:witness]).to include("can't be blank")
  end

  it 'is invalid without nickname field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, incident_date: nil)
    
    report.valid?
    expect(report.errors[:incident_date]).to include("can't be blank")
  end

  it 'is invalid without nickname field' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, incident_location: nil)
    
    report.valid?
    expect(report.errors[:incident_location]).to include("can't be blank")
  end

  it 'is invalid with input birtday in future' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, perpetrator_birthday: "2030-01-01")

    report.valid?
    expect(report.errors[:perpetrator_birthday]).to include("can't be in the future")
  end

  it 'is invalid with input incident date in future' do
    user = FactoryBot.create(:user)
    report = FactoryBot.build(:report, incident_date: "2030-01-01")

    report.valid?
    expect(report.errors[:incident_date]).to include("can't be in the future")
  end
end
