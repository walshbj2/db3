class UserRepository
BUCKET = 'users'

# Set up connection to the Riak db
def initialize(client)
@client = client
end
def all
end
# ??
def delete(user)
users = @client.bucket(BUCKET)
users.delete(user)
end
def find(key)
riak_obj = @client.bucket(BUCKET)[key]
user = User.new
user.email = riak_obj.data['email']
user.name = riak_obj.data['name']
user.password = riak_obj.data['password']
user.blurb = riak_obj.data['blurb']
user.follows = riak_obj.data['follows']
user.followers - riak_obj.data['followers']
user
end
def save(user)
users = @client.bucket(BUCKET)
key = user.email
unless users.exists?(key)
riak_obj = users.new(key)
riak_obj.data = user
riak_obj.content_type = 'application/json'
riak_obj.store
end
end
# ??
def update(user)
users = @client.bucket(BUCKET)
key = user.email
if users.exists?(key)
riak_obj
end
def follow(follower, followed)
if follower.follows
follower.follows << followed.email
else
follower.followed = [followed.email]
end
if followed.followers
followed.followers << follower.email
else
followed.followers = [follows.email]
end
update(followed)
update(follower)
end
end