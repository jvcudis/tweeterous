require 'spec_helper'

describe "User" do
  before do
    @user = User.create :name => 'dyosa', :email => 'dyosa@gmail.com'
  end
  describe "GET /users" do
    it 'displays user information' do
      visit users_path
      page.should have_content 'dyosa'
      page.should have_content 'dyosa@gmail.com'
    end

    it 'creates a new user account' do
      visit users_path
      click_link 'Create Account'
      current_path.should == new_user_path
      page.should have_content 'Create A Tweeterous Account'
      fill_in 'Name', :with => 'pikachu'
      fill_in 'Email', :with => 'pikachu@pokemon.com'
      click_button 'Create'
      current_path.should == users_path
      page.should have_content 'pikachu'
      page.should have_content 'pikachu@pokemon.com'
    end
  end
end