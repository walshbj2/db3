(function() { // We use this anonymous function to create a closure.

	var app = angular.module('splatter-web', ['ngResource']);

	app.factory('User', function($resource) {
		return $resource('http://walsh.sqrawler.com/api/users/:id.json', {id: '@id'},
			{'update': {method:'PUT'}} );
			follow: {method:'POST', url:'http://walsh.sqrawler.com/api/users/follows/'},
addsplatt: {method:'POST', url:'http://walsh.sqrawler.com/api/splatts/'},
unfollow: {method:'DELETE', url:'http://walsh.sqrawler.com/api/users/follows/:id/:follows_id'}})
	});
	
	app.factory('SplattsFeed', function($resource)
{
return $resource('http://walsh.sqrawler.com/api/users/splatts-feed/:id.json',{},{
getsplatts: {method:'GET',url:'http://walsh.sqrawler.com/api/users/splatts/:id.json', isArray:true}});
});

	app.controller('UserController', function(User) {
		this.data = {};
		this.ulist = User.query();
		this.getUser = function(i) {
		return User.get({id: i});
	});

	this.login = function() {
		this.loggedin_user = this.getUser(this.data.id);
		this.data = {};
	};

	this.updateUser = function() {
		this.loggedin_user.name = this.data.name;
		this.loggedin_user.email = this.data.email;
		this.loggedin_user.blurb = this.data.blurb;
		this.loggedin_user.$update();
		this.data = {};
	});
	
	app.controller("AddUserController", function(User){
		this.data = {};
		this.createUser = function(user) {
		var dataName = this.data.cname;
		var dataMail = this.data.cemail;
		var dataPassword = this.data.cpassword;
		user = new User({name: dataName, email: dataMail, password: dataPassword});
		//user.$save();
		User.save(user,user);
		document.getElementById('prompt').innerHTML = "User Added";
		//this.user = User.save({name: dataName, email: dataMail, password: dataPassword});
		this.data = {}; // clears the form
	}
	});

	this.createUser = function() {
		u = new User();
		u.name = this.data.cname;
		u.email = this.data.cemail;
		u.password = this.data.cpassword;
		u.blurb = this.data.cblurb;
		u.$save();
		this.data = {};
	};

	this.delUser = function() {
		//alert("Deleting "+ this.data.delid);
		User.delete({id: this.data.delid});
	};
	
	});

	
})();