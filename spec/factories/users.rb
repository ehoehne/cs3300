FactoryBot.define do
    factory :user do
      email { 'test1@gmail.com' }
      password { '123456' }
    end

    def sign_in(user)
      visit new_user_session_path

      within("form") do
        fill_in "Email", with: "test1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Log in"
      end
    end
  end 