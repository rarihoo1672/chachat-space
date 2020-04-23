require "rails_helper"

RSpec.describe Message, type: :model do

  describe "#create" do
    context "messageを保存できる場合" do
      it "chat_messageがあれば保存できること" do
        expect(build(:message, chat_image: nil)).to be_valid
      end

      it "chat_imageがあれば保存できること" do
        expect(build(:message, chat_message: nil)).to be_valid
      end

      it "chat_messageとchat_imageがあれば保存できること" do
        expect(build(:message)).to be_valid
      end
    end

    context "messageが保存できない場合" do
      it "chat_messageとchat_imageが両方が空だと保存できないこと" do
        message = build(:message, chat_message: nil, chat_image: nil)
        message.valid?
        expect(message.errors[:chat_message]).to include("を入力してください")
      end

      it "group_idがないと保存できないこと" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it "user_idがないと保存できないこと" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end 
    end
  end
end