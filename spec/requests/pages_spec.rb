require 'spec_helper'

describe "Pages" do
  describe "GET /pages/home" do
    it 'has a home page link' do
      visit pages_home_path
    end
    it 'has a the proper title: Tweeterous | Home' do
      visit pages_home_path
      page.should have_xpath("//title", :text => "Tweeterous | Home")
    end
    it 'has a home page as root page' do
      visit root_path
      page.should have_xpath("//title", :text => "Tweeterous | Home")
    end
  end

  describe "GET /pages/contact" do
    it 'has a contact page link' do
      visit pages_contact_path
    end
    it 'has a the proper title: Tweeterous | Contact' do
      visit pages_contact_path
      page.should have_xpath("//title", :text => "Tweeterous | Contact")
    end
  end

  describe "GET /pages/about" do
    it 'has an about page link' do
      visit pages_about_path
    end
    it 'has a the proper title: Tweeterous | About' do
      visit pages_about_path
      page.should have_xpath("//title", :text => "Tweeterous | About")
    end
  end
end