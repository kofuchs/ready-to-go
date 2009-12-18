# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => APP_CONFIG[:session_name],
  :secret      => '933d24f169f2ac615b0994c950b0c4407e8b17f11f3d8e93cd3bf6118d8a9bfe96719ee0711b345a6856932e9a3ab9f1ee5f7351048c12db6c508f2755623e5e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
