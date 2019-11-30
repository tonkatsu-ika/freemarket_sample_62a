require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'アドレスの登録ができる' do
    
    it "アソシエーションでのaddress登録ができる" do
      address = FactoryBot.create(:address)
      address.valid?
      expect(address).to be_valid
    end

  end
  context 'アドレスの登録ができない' do

    it "post_codeがない場合に" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end
    it "addresssがない場合に" do
      address= build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end
    
    it "prefecture_idがない場合に" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください") 
    end
    it "user_idがない場合に" do  
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user_id]).to include("を入力してください") 
    end

  end
  
end
