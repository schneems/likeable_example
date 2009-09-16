# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_devise_example_session',
  :secret      => 'a9673d77367c57079a81edbb5cbccd66753842847c2b3ed9d9cd0b31fd8f69f61de459b4b112f71d6792640d2c9d8c7bed41088c92dcb06f053747e95947a453'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
