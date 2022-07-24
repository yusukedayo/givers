require 'rails_helper'

RSpec.describe User, type: :model do
  fit "name と email を持ったユーザーを登録できること" do
    user = User.new(
      user_name: "John",
      email: "john@example.com",
      password: "password",
      password_confirmation: "password",
      )
    expect(user).to be_valid
  end
end
