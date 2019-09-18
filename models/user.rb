class User < ActiveRecord::Base

end

bundle exec tux
user = User.new({ username: "sharky_j", avatar_url: "http://naserca.com/images/sharky_j.jpg" })
If this worked, you should see something like the following.
  