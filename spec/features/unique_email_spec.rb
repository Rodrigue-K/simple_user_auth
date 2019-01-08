RSpec.feature 'email uniqueness' do
  context 'User sign up'
  let!(:user) { User.create(email: 'test@test.com', password: 'secret123')}

  scenario 'A user cannot signup with an existing email' do
    visit '/'
    click_on 'Sign up'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'secret123'
    click_button 'Sign up'
    expect(page).to have_content('Email already exists')
  end
end
