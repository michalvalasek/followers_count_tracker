#!/usr/bin/env ruby

# Script gets current followers count for each username in usernames.txt
# output goes to user-specific files in folder storage/
# Author: Michal Valasek
# 2012

require 'twitter'

app_dir = File.dirname(__FILE__) 

f_usernames = File.open(app_dir + '/usernames.txt')

processed_usernames = 0
f_usernames.each do |line|
  
  username = line.match(/^[a-zA-Z_]*/).to_s
  next if username.empty? # skip line if incorrect username
  
  user_file = File.open(app_dir + "/storage/#{username}.txt",'a+')
  user_file.rewind
  
  # skip loop if we already have line for today in the output file
  lines = user_file.lines.to_a
  next if lines.last && lines.last[0..9]==Time.now.strftime('%Y-%m-%d')
  
  begin
    user = Twitter.user(username)
  rescue Twitter::Error::NotFound
    user = nil
  end

  unless user.nil?
    user_file.puts "#{Time.now.strftime('%Y-%m-%d')},#{user.followers}"
    processed_usernames += 1
  end
  
  user_file.close
end

f_usernames.close

end_message = "Usernames processed: #{processed_usernames}"
puts end_message