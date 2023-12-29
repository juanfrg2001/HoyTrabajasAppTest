require 'rails_helper'

RSpec.describe Bank, type: :model do
  describe "Validations" do
    context "Presence" do
      it "is invalid without a name" do
        bank = Bank.new
        expect(bank).to_not be_valid
        expect(bank.errors[:name]).to include("can't be blank")
      end

      it "is valid with a name" do
        bank = Bank.new(name: "Example Bank")
        expect(bank).to be_valid
      end
    end

    context "Length" do
      it "is valid with a name with 50 characters or less" do
        bank = Bank.new(name: "A" * 50)
        expect(bank).to be_valid
      end

      it "is invalid with a name longer than 50 characters" do
        bank = Bank.new(name: "A" * 51)
        expect(bank).to_not be_valid
        expect(bank.errors[:name]).to include("is too long (maximum is 50 characters)")
      end
    end
  end
end
