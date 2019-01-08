require 'user'

describe User do
   let(:user) { User.new(email: 'test@test.com', password: 'Password') }

  it 'should check if a user exists when signing in' do
    expect(User.authenticate('testing@gmail.com', '123456')).to eq (nil)
  end

  it "should check that the user's password is correct when signing in" do
    expect(User.authenticate("test@test.com", "Password")).to eq (nil)
  end
end
