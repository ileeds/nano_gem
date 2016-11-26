require_relative 'nanoTwitter.rb'
require 'minitest/autorun'
require 'minitest/spec'
require 'rack/test'
require 'byebug'
require 'net/http'
require 'uri'

include Rack::Test::Methods

describe "client library" do
	def setup
		@client = NanotwitterClient.new("client")
		@index = 10
		@id = 2
	end

	#goes to route and collects json data to compare
	def getJson(url)
		encoded_url = URI.encode("https://cryptic-mountain-56365.herokuapp.com/api/v1"+url)
		uri = URI.parse(encoded_url)
		json = Net::HTTP.get(uri)
	end

	it "should find tweets" do
		result=@client.find_tweet(@index)
		json = getJson("/tweets/#{@index}")
		assert_equal result, json
	end

	it "should find users" do
		result=@client.find_user(@index)
		json = getJson("/users/#{@index}")
		assert_equal result, json
	end

	it "should find recent tweets" do
		result=@client.recent_tweets(@index)
		json = getJson("/recent/tweets?#{@index}")
		assert_equal result, json
	end

	it "should find recent tweets by a single user" do
		result=@client.users_recent_tweets(@id, @index)
		json = getJson("/users/#{@id}/tweets?#{@index}")
		assert_equal result, json
	end

end
