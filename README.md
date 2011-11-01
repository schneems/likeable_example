# Likeable Example for Rails 3

Example App using likeable (http://github.com/gowalla/likeable). Based on an example app using devise :) http://github.com/plataformatec/devise

## Screencast

You can view a [screencast of likeable on youtube](http://youtu.be/nINGHWqPz3I?hd=1)



## Installation

Install [Redis](http://redis.io/) if it isn't already, if you're on a mac you can run install it using [homebrew](http://mxcl.github.com/homebrew/) :

```
brew install redis
```


Install bundler if you haven't yet:

```
gem install bundler
```

Install the gems:

```
bundle install
```

This will install Rails 3, sqlite3-ruby gem and Devise 1.4.7, and likeable.

Rake devise setup task:

```
rake likeable:setup
```

This will:

* drop any existing database
* create a new database
* migrate the database
* create a default user and admin

Run the server and use the credentials provided by the rake task to sign in and test the application.

Navigate to posts and try liking and unliking the post. Its that simple

## License

MIT License. Copyright 2011 [schneems](http://schneems.com)
