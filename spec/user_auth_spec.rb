require 'user'

describe User do
   let(:user) { User.new(email: 'test@test.com', password: 'Password') }

  it 'should return user to sign up page if user does' do
    expect(User.authenticate('testing@gmail.com', '123456')).to eq (nil)
  end
end
