class User < Hashie::Dash
	property :email
	property :name
	property :password
	property :blurb
	property :follows
	property :followers
end
