class HomeController < ApplicationController

	require 'twitter'
  require 'time'

  def top
  	@client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TW_CONSUMER_KEY']
      config.consumer_secret     = ENV['TW_CONSUMER_SECRET']
      config.access_token        = ENV['TW_ACCESS_TOKEN']
      config.access_token_secret = ENV['TW_ACCESS_TOKEN_SECRET']
    end

    tweets = @client.user_timeline.first(20)

    popular = Instagram.user_recent_media
    popular.each do |insta|
      insta[:created_at] = Time.at(insta[:created_time].to_i)
    end

    @posts = (tweets + popular).sort_by {|post| post.created_at}.reverse!
  end
end

 
    

