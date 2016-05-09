require 'rails_helper' 
RSpec.feature "login", :type =>  :feature do
  before :each do
      visit new_user_session_path
  end
  scenario "user logging in with valid credentials" do
      @user = FactoryGirl.create(:user)
      fill_in "Email", with: @user.email
      fill_in "Password", with: "foobar"
      click_button "Log in"
      expect(page).to have_content(@user.name)
      expect(page).to have_selector('div.alert.alert-success')
  end
  scenario "user logging in with invalid credentials" do
    click_button "Log in"
    expect(page).to have_selector('div.alert.alert-danger')
  end
end
RSpec.feature "logout", :type =>  :feature do
  scenario "user is able to log out" do
    @user = FactoryGirl.create(:user)
    login_as @user
    visit team_path
    page.click_link "#{@user.name}" 
    page.click_link "Logout" 
    expect(page).to_not have_content(@user.name)
    expect(page).to have_content("Login")
    expect(page).to have_selector('div.alert.alert-success')
  end
end

RSpec.describe Users::SessionsController, :type => :controller do

  before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
  end
  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET destroy" do
    before(:each) do
      login_with FactoryGirl.create(:user) 
    end
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:redirect)
    end
  end

end
