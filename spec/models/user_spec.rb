require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new(email: "user@test.com", password: "password", password_confirmation: "password") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a minimum length of 3" do
      subject.password_digest = "12"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password digest is too short (minimum is 3 characters)")
    end

    it "is not valid without a password_digest" do
      subject.password_digest = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password digest can't be blank")
    end

    it "is not valid without a password_confirmation" do
      subject.password_digest = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end

    it "is a valid email without case sensitivity" do
      subject.email == "usEr@Test.com"
      expect(subject).to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
     subject { described_class.new(email: "user@test.com", password: "password", password_confirmation: "password") }
     subject.password = password
     subject.email = email
     expect(subject).to be_valid
    end


end
