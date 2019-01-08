require 'user'

describe User do

  it "check a user's existence" do
    expect(User.authenticate('testing@gmail.com', '123456')).to eq (nil)
  end

  it "check that the user's password is correct" do
    expect(User.authenticate("test@test.com", "Password")).to eq (nil)
  end

  it "check that the username and password are both correct" do
    user = User.create(email: "test@test.com", password: "Password")
    expect(User.authenticate("test@test.com", "Password")).to eq (user)
  end
  

end
