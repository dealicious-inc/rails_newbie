require 'rails_helper'

RSpec.describe "Pages", type: :system do
  before do
    @user = create :user
  end

  it '폐쇄형 사이트 테스트' do
    visit root_path
    expect(page).to have_text('Log in')

    # visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    expect(page).to have_text('Pages#show')
  end
end