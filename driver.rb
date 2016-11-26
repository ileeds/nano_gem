require_relative 'nanoTwitter.rb'

a=NanotwitterClient.new
puts a.find_user(1)
puts a.find_tweet(1)
puts a.recent_tweets(20)
puts a.users_recent_tweets(1,20)
