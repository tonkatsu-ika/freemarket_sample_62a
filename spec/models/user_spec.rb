require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe User do
    describe '#done' do

      #テスト　user登録できる
      context 'can save' do 
        #passwordが6文字以上であれば登録できること
        it "is valid with a password that has more than 6 characters " do
          user = build(:user, password: "000000", password_confirmation: "000000")
          user.valid?
          expect(user).to be_valid
        end
      end

      #テスト　user登録できない
      context 'cannot save' do 
          #emailが空では登録できないこと
        it "is invalid without a email" do
          user = build(:user, email: nil)
          user.valid?
          expect(user.errors[:email]).to include("を入力してください")
        end
        #passwordが空では登録できないこと
        it "is invalid without a password" do
          user = build(:user, password: nil)
          user.valid?
          expect(user.errors[:password]).to include("を入力してください")
        end
        #password_confirmationが空では登録できないこと
        it "is invalid without a password_confirmation" do
          user = build(:user, password_confirmation: nil)
          user.valid?
          expect(user.errors[:password_confirmation]).to include("を入力してください")
        end
        #nicknameが空では登録できないこと
        it "is invalid without a nickname" do
          user = build(:user, nickname: nil)
          user.valid?
          expect(user.errors[:nickname]).to include("を入力してください")
        end
        #last_nameが空では登録できないこと
        it "is invalid without a last_name" do
          user = build(:user, last_name: nil)
          user.valid?
          expect(user.errors[:last_name]).to include("を入力してください")
        end

        #last_name_kanaが空では登録できないこと
        it "is invalid without a last_name_kana" do
          user = build(:user, last_name_kana: nil)
          user.valid?
          expect(user.errors[:last_name_kana]).to include("を入力してください")
        end
        #first_nameが空では登録できないこと
        it "is invalid without a first_name" do
          user = build(:user, first_name: nil)
          user.valid?
          expect(user.errors[:first_name]).to include("を入力してください")
        end
        #first_name_kanaが空では登録できないこと
        it "is invalid without a first_name_kana" do
          user = build(:user, first_name_kana: nil)
          user.valid?
          expect(user.errors[:first_name_kana]).to include("を入力してください")
        end
        #birthdayが空では登録できないこと
        it "is invalid without a birthday" do
          user = build(:user, birthday: nil)
          user.valid?
          expect(user.errors[:birthday]).to include("を入力してください")
        end

        # 重複したemailが存在する場合登録できないこと
        it "is invalid with a duplicate email address" do
          user = create(:user)
          another_user = build(:user, email: user.email)
          another_user.valid?
          expect(another_user.errors[:email]).to include("はすでに存在します")
        end

        end

        # passwordが5文字以下であれば登録できないこと
        it "is invalid with a password that has less than 5 characters " do
          user = build(:user, password: "00000", password_confirmation: "00000")
          user.valid?
          expect(user.errors[:password]).to include("は6文字以上で入力してください")
        end
      end
  end
end
