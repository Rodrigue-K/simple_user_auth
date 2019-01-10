RSpec.feature 'Unique email' do
  context 'Sign up'

  before do
    User.create(email: "test@test.com", password: "Password")
  end

  scenario 'A user cannot signup with an existing email' do
    visit '/'
    click_on 'Sign up'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'secret123'
    click_button 'Sign up'
    expect(page).to have_content("We already have that email.")
  end
end
