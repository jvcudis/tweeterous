require 'spec_helper'

describe "Tweet" do
  before do
    @tweet = Tweet.create :content => 'The bird tweets!', :user_id => '1'
  end
  describe "GET /tweets" do
    it 'displays tweets' do
      visit tweets_path
      page.should have_content 'The bird tweets!'
    end

    it 'creates new tweets' do
      visit tweets_path
      fill_in 'tweet_content', :with => 'Tweety Bird tweets!'
      fill_in 'tweet_user_id', :with => 1
      click_button 'Tweet!'
      current_path.should == tweets_path
      page.should have_content 'Tweety Bird tweets!'
      page.should have_content 'Amazing tweet!'
    end

    it 'cannot create empty tweets' do
      visit tweets_path
      fill_in 'tweet_content', :with => ""
      fill_in 'tweet_user_id', :with => 1
      click_button 'Tweet!'
      current_path.should == tweets_path
#      page.should have_content 'Nothing to tweet! Please input something.'
    end

    #tweets with no user id == 0
#    it 'cannot create unknown tweeters' do
#     visit tweets_path
#      fill_in 'tweet_content', :with => "Hey I can tweet!"
#      fill_in 'tweet_user_id', :with => 0
#      click_button 'Tweet!'
#      current_path.should == tweets_path
#      page.should have_content 'You have no right to tweet! Get an account first!'
#      page.should have_no_content 'Hey I can tweet'
#    end

    #maximum input would be 100 characters
    it 'cannot accept long tweets' do
      visit tweets_path
      fill_in 'tweet_content', :with => 'This is a very loooooooooooooooooooong tweet! Really a very looooooooooooooooooooong tweeeeeeeeeeeeeeeeeet!'
      fill_in 'tweet_user_id', :with => 1
      click_button 'Tweet!'
      current_path.should == tweets_path
#      page.should have_content 'Tweet is too long!'
#      page.should have_no_content 'This is a very loooooooooooooooooooong tweet! Really a very looooooooooooooooooooong tweeeeeeeeeeeeeeeeeet!'
    end
  end
end