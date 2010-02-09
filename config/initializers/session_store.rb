# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_alacarte_session',
  :secret      => 'f0b6d29d6e7af0352b78d99396c3a5e0867816a59653a87912326aab245f2059febd744a9d3f31ce91c3f0edc1bc15b58b63ce5c6b4cfbbded42b86ba5d859a6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
