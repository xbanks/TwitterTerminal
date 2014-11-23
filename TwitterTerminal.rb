require 'twitter'
require './MyInfo.rb' # This contains my access information for twitter

config = {
  consumer_key: MyInfo::CONSUMER_KEY,
  consumer_secret: MyInfo::CONSUMER_SECRET,
  access_token: MyInfo::ACCESS_TOKEN,
  access_token_secret: MyInfo::ACCESS_TOKEN_SECRET
}


rest_client = Twitter::REST::Client.new(config)
stream_client = Twitter::Streaming::Client.new(config)

puts "Now streaming incoming tweets:"
puts '-' * 15

stream_client.user do |object|
  case object
  when Twitter::Tweet
    puts "@%s: %s" % [object.user.screen_name, object.full_text]
  end
end
