require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid with valid attributes" do
    user = User.new(email: "test@example.com", password: "password", password_confirmation: "password")
    expect(user).to be_valid
  end

  it "is not valid without an email" do
    user = User.new(password: "password", password_confirmation: "password")
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.new(email: "test@example.com")
    expect(user).to_not be_valid
  end

  it "is not valid with a password less than 6 characters" do
    user = User.new(email: "test@example.com", password: "pass", password_confirmation: "pass")
    expect(user).to_not be_valid
  end

  it "is not valid with a password_confirmation that does not match password" do
    user = User.new(email: "test@example.com", password: "password", password_confirmation: "different_password")
    expect(user).to_not be_valid
  end

  # Agregar más pruebas según las validaciones y comportamientos deseados para el modelo User
end