class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.new(params[:tweet])
    if @tweet.save
      redirect_to :back, :notice => 'Amazing tweet!'
    else

      redirect_to :back, :notice => @tweet.errors.full_messages #'Nothing to tweet! Please input something.'
    end
  end

end
