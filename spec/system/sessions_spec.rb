require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  before do
    @user = create :user
  end

  it '로그인 시도' do
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    expect(page).to have_text('Pages#show')
  end
end