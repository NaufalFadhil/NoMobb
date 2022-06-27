require 'rails_helper'

RSpec.describe Report, type: :model do
  describe "Field Report Test" do
    it 'is valid with full input field' do
      report = Report.new(
        user_id: 1,
        perpetrator: 'Naufal Fadhil Athallah',
        reason: 'Memukul saya',
        proof: 'https:drive.google.com',
        witness: 'Nurma',
        incident_location: 'Sekolah saya',
        status: 'PENDING',
        is_valid: false,
        deleted_at: nil,
        created_at: 'Sun, 26 Jun 2022 20:43:18.365332000 WIB +07:00',
        updated_at: 'Sun, 26 Jun 2022 20:43:18.365332000 WIB +07:00',
      )

      expect(report).to be_valid
    end

    it 'is invalid without perpetrator field' do
      report = Report.new(
        perpetrator: nil,
        reason: nil,
        proof: nil,
        witness: nil,
        incident_location: nil,
      )
  
      report.valid?
      expect(report.errors[:perpetrator]).to include("can't be blank")
    end

    it 'is invalid without reason field' do
      report = Report.new(
        perpetrator: nil,
        reason: nil,
        proof: nil,
        witness: nil,
        incident_location: nil,
      )
  
      report.valid?
      expect(report.errors[:reason]).to include("can't be blank")
    end

    it 'is invalid without proof field' do
      report = Report.new(
        perpetrator: nil,
        reason: nil,
        proof: nil,
        witness: nil,
        incident_location: nil,
      )
  
      report.valid?
      expect(report.errors[:proof]).to include("can't be blank")
    end

    it 'is invalid without witness field' do
      report = Report.new(
        perpetrator: nil,
        reason: nil,
        proof: nil,
        witness: nil,
        incident_location: nil,
      )
  
      report.valid?
      expect(report.errors[:witness]).to include("can't be blank")
    end

    it 'is invalid without incident location field' do
      report = Report.new(
        perpetrator: nil,
        reason: nil,
        proof: nil,
        witness: nil,
        incident_location: nil,
      )
  
      report.valid?
      expect(report.errors[:incident_location]).to include("can't be blank")
    end
  end
end
