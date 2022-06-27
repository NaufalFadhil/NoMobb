require 'rails_helper'

RSpec.describe PerpetratorDetail, type: :model do
  describe "Field Perpetrator Detail Test" do
    it 'is valid with full input field' do
      perpetrator_detail = PerpetratorDetail.new(
        fullname: 'Naufal Fadhil Athallah',
        nickname: 'Fadhil',
        birthday: '07-04-2001',
        deleted_at: nil,
        created_at: 'Thu, 23 Jun 2022 12:44:46.438106000 WIB +07:00',
        updated_at: 'Thu, 23 Jun 2022 12:44:46.438106000 WIB +07:00',
      )

      expect(perpetrator_detail).to be_valid
    end

    it 'is invalid without fullname field' do
      perpetrator_detail = PerpetratorDetail.new(
        fullname: nil,
        nickname: nil,
        birthday: nil,
      )
  
      perpetrator_detail.valid?
      expect(perpetrator_detail.errors[:fullname]).to include("can't be blank")
    end

    it 'is invalid without nickname field' do
      perpetrator_detail = PerpetratorDetail.new(
        fullname: nil,
        nickname: nil,
        birthday: nil,
      )
  
      perpetrator_detail.valid?
      expect(perpetrator_detail.errors[:nickname]).to include("can't be blank")
    end

    it 'is valid without birthday field' do
      perpetrator_detail = PerpetratorDetail.new(
        fullname: 'Naufal Fadhil Athallah',
        nickname: 'Fadhil',
        birthday: nil,
      )

      expect(perpetrator_detail).to be_valid
    end
  end
end
