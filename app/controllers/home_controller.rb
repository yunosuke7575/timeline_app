class HomeController < ApplicationController

	require 'twitter'


  def top
  	@client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TW_CONSUMER_KEY']
      config.consumer_secret     = ENV['TW_CONSUMER_SECRET']
      config.access_token        = ENV['TW_ACCESS_TOKEN']
      config.access_token_secret = ENV['TW_ACCESS_TOKEN_SECRET']
  end
  @client = @client.user_timeline.first(20)
  @popular = Instagram.user_recent_media
  @posts = @client + @popular
end
end