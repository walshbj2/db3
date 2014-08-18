#!/usr/bin/ruby

rake db:reset

# Create 3 Users
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/users -d '{"user": {"email":"test@foo.com", "name":"Test User 1", "password":"P@sssword"}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/users -d '{"user": {"email":"test2@foo.com", "name":"Test User 2", "password":"P@sssword1"}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/users -d '{"user": {"email":"test3@foo.com", "name":"Test User 3", "password":"P@sssword2"}}'

# Create 5 splatts for each user
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hi Everybody", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hi", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hello", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"how are you today?", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hi Everybody", "user_id":2}}'

curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Great", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"thats good will see you later", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"im great", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"ok", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"enjoy your day", "user_id":1}}'

curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"ok", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"thanks", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"I eat Red", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Youre weird", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/splatts -d '{"splatt": {"body":"haha shame", "user_id":3}}'

# The first user follows the other 2
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/users/follows -d '{"id":1, "follows_id":2}'
curl -i -H "Content-type: application/json" -X POST http://walsh.sqrawler.com:3000/users/follows -d '{"id":1, "follows_id":3}'

# Gets the first user's splatts
curl -i -H "Content-type: application/json" -X GET http://walsh.sqrawler.com:3000/users/splatts/1

# Gets the users followed by the first user
curl -i -H "Content-type: application/json" -X GET http://walsh.sqrawler.com:3000/users/follows/1

# Gets the first user's newsfeed
curl -i -H "Content-type: application/json" -X GET http://walsh.sqrawler.com:3000/users/splatts-feed/1

# First user unfollows the third user
curl -i -H "Content-type: application/json" -X DELETE http://walsh.sqrawler.com:3000/users/follows/1/3

# Gets the first user's newsfeed after unfollowing the third
curl -i -H "Content-type: application/json" -X GET http://walsh.sqrawler.com:3000/users/splatts-feed/1
