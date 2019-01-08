require "user"

describe User do

  it "expects a user's email to be unique" do
    user = User.create(email: "test@test.com", password: "Password")
    user2 = User.create(email: "test@test.com", password: "Password")
    expect(user2.valid?).to eq false #("test@test.com", "Password")).to raise_error "Email already exists"
  end
end
